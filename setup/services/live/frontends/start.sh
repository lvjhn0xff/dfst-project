#!/bin/sh
if [ "$PROJECT_RAW_CLI" = "true" ] ; then
    touch .tmp && tail -f .tmp
else
    cd /home/project/source
    echo "🚀 Starting Caddy with auto-reload enabled..."
    
    # Run caddy.
    caddy run \
        --config /home/project/Caddyfile \
        --adapter caddyfile 
fi 