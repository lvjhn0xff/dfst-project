#!/bin/sh
echo "🚀 Starting Caddy with auto-reload enabled..."

# Run caddy.
caddy run \
    --config /home/project/Caddyfile \
    --adapter caddyfile 