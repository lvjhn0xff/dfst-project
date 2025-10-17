# Get parameters.
ARG CADDY_VERSION=caddy:2.10.2-alpine

# Load caddy.
FROM $CADDY_VERSION 

# Copy Caddyfiles
COPY ./setup/services/live/router/http/Caddyfile /home/project/Caddyfile
COPY ./setup/services/live/router/http/sites /home/project/sites

# Copy start.sh
COPY ./setup/services/live/router/http/start.sh /home/project/start.sh
