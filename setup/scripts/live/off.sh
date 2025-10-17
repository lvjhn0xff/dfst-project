#!/bin/bash

source setup/scripts/live/@live-context

# Remove containers.
echo ":: Stopping and removing containers."
bash docker-compose down 
