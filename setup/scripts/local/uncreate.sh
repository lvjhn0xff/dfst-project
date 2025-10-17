#!/bin/bash

source setup/scripts/local/@local-context 

# Remove containers, networks, and volumes. 
echo ":: Removing containers, networks, and volumes."
bash docker-compose down -v