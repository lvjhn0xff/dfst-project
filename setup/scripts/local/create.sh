#!/bin/bash 

source setup/scripts/local/@local-context 

# Create services.
echo ":: Creating service containers."
bash docker-compose create