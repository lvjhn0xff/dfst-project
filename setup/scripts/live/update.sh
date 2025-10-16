#!/bin/bash 

source setup/scripts/live/@live-context

# Pull images from Dockerhub. 
echo "Pulling images from Dockerhub..."
bash docker-compose pull