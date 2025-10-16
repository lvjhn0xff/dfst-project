#!/bin/bash

source setup/scripts/local/@local-context 

# Stop containers.
echo ":: Removing containers and networks."
bash docker-compose down 

# Reset frontend.
source setup/scripts/local/resets/reset-frontend.sh 

# Remove containers.
echo ":: Removing containers, networks, and volumes."
bash docker-compose down -v 
