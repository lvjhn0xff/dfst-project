#!/bin/sh
# Non-root, lightweight Laravel CA reload script

LOGFILE="/home/project/ca-reload.log"
CA_FILE="/data/caddy/pki/authorities/local/root.crt"

# Initialize last modification time
LAST_MTIME=0

echo "$(date): Smart CA reload script started" >> "$LOGFILE"

while true; do
    if [ -f "$CA_FILE" ]; then
        # Get current modification time
        CURRENT_MTIME=$(stat -c %Y "$CA_FILE")

        if [ "$CURRENT_MTIME" -ne "$LAST_MTIME" ]; then
            echo "$(date): CA file changed, clearing Laravel cache" >> "$LOGFILE"
            
            php artisan config:clear >> "$LOGFILE" 2>&1
            php artisan cache:clear >> "$LOGFILE" 2>&1

            # Update last modification time
            LAST_MTIME=$CURRENT_MTIME
        fi
    else
        echo "$(date): CA file not found: $CA_FILE" >> "$LOGFILE"
    fi

    sleep 3600  # check every hour
done
