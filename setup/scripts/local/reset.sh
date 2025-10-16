#!/bin/bash

source setup/scripts/local/@local-context 

# Stop containers.
echo ":: Removing containers and networks."
bash docker-compose down 

# Reset frontend.
# Install dependencies in front-end.
if [ "$PROJECT_FRONTEND_ONLY" == true ]; then
    source setup/scripts/local/reset/reset-frontend.sh
else 
    source setup/scripts/local/reset/reset-frontend.sh
    source setup/scripts/local/reset/reset-backend.sh
fi

# Remove containers.
echo ":: Removing containers, networks, and volumes."
bash docker-compose down -v 
