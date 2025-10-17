#!/bin/bash 

source setup/scripts/live/@live-context

# Remove containers, networks, and volumes. 
echo ":: Removing containers, networks, and volumes (live mode)." 
bash docker-compose down -v