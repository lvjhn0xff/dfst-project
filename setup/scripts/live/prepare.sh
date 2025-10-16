#!/bin/bash 

source setup/scripts/live/@live-context

# Tag Version
export PROJECT_IMAGE_TAG_AS="$(date -u +%Y%m%d-%H%M%S)"

# Build images. 
echo ":: Building images for project (live mode)." 
bash docker-compose build 
echo $PROJECT_IMAGE_TAG_AS > ./setup/values/docker-latest-tag

# Create images. 
echo ":: Creating images." 
bash docker-compose create 