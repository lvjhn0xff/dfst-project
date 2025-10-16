#!/bin/bash

source setup/scripts/local/@local-context 

# Build images. 
bash setup/scripts/local/build.sh 

# Create containers. 
bash setup/scripts/local/create.sh

# Install dependencies in front-end.
source setup/scripts/local/setups/setup-frontend.sh



