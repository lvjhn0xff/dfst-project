#!/bin/bash

source setup/scripts/local/@local-context 

# Add backend. 
if [ ! -d setup/services/local/backend ]; then
    bash setup/utils/projects/backends/add-backend.sh
fi

# Build images. 
bash setup/scripts/local/build.sh 

# Create containers. 
bash setup/scripts/local/create.sh


# Install dependencies in front-end.
if [ "$PROJECT_FRONTEND_ONLY" == true ]; then
    source setup/scripts/local/setups/setup-frontend.sh
else 
    source setup/scripts/local/setups/setup-frontend.sh
    source setup/scripts/local/setups/setup-backend.sh
fi

# Fix permissions.
bash setup/fix-permissions

# Turn of services to ensure a proper on.
bash template project off

