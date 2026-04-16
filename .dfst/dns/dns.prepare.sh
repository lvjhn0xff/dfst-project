#!/bin/bash
set -e

trace() { echo -e "\033[1;34m[TRACE]\033[0m \033[0;90m($(date +%H:%M:%S))\033[0m $1"; }

# 1. Setup
PROJECT_MODE=${1:-development} 
CONTAINER_NAME="dfst-dns"
CONFIG_DIR="$HOME/.dfst-dnsmasq"

# UPDATED: Using the system-managed per-user RAM disk
# $UID is a built-in bash variable for your User ID (e.g., 1000)
RAM_BASE="/run/user/$UID/dfst-dns"
RAM_CONF_DIR="$RAM_BASE/conf.d"

NETWORK_NAME="dfst-net"
DNS_IP="172.30.0.10"
TARGET_CONF="$PROJECT_MODE.conf"

# 2. SSD Operation (Persistent config)
mkdir -p "$CONFIG_DIR"
if [ ! -f "$CONFIG_DIR/dnsmasq.conf" ]; then
    cat > "$CONFIG_DIR/dnsmasq.conf" <<EOF
user=root
no-resolv
no-hosts
port=53
log-queries
log-facility=-
bind-dynamic
conf-dir=/etc/dnsmasq.d/conf.d
EOF
fi

# 3. RAM Operation (Now utilizing native user isolation)
# /run/user/$UID is already set to 700 by the system.
mkdir -p "$RAM_CONF_DIR"

# --- NEW: Write the actual record ---
trace "RAM WRITE: Generating record in $RAM_CONF_DIR/$TARGET_CONF"
echo "address=/dfst-project.lan/0.0.0.0" > "$RAM_CONF_DIR/$TARGET_CONF"

# 4. Infrastructure Container
if [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    trace "DOCKER: Starting fresh container..."
    docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
    docker run -d \
      --name "$CONTAINER_NAME" \
      --network "$NETWORK_NAME" \
      --ip "$DNS_IP" \
      --cap-add=NET_ADMIN \
      --restart always \
      -v "$CONFIG_DIR/dnsmasq.conf:/etc/dnsmasq.conf:ro" \
      -v "$RAM_CONF_DIR:/etc/dnsmasq/conf.d:rw" \
      dockurr/dnsmasq -k
else 
  trace "DOCKER: Reloading rules..."
  # Tip: dnsmasq can often reload via SIGHUP if you don't want a full restart
  docker restart "$CONTAINER_NAME"
fi

echo -e "\n\033[1;32m[DONE]\033[0m DNS for $PROJECT_MODE is live at $DNS_IP"