#!/bin/bash 

source setup/scripts/local/@local-context 

# Create services.
echo ":: Building project images."
bash docker-compose build