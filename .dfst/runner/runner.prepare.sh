#!/usr/env/bin bash

set -e 

source ./.dfst/runner/runner.base.sh

# --- Settings --- #
IMAGE="python:3.14"
FORCE=false 

# --- Check for --force flag --- #
if [ "$1" == "--restart" ]; then 
    FORCE=true 
fi 

# --- Stop and remove only if --force is supplied --- # 
if [ "$FORCE" = true ]; then
    if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then 
        echo "Force flag detected: stopping and removing existing container..."
        docker rm -f "$CONTAINER_NAME"
    fi 
else 
    if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then 
        echo "Container already exists. Use --force to restart it."
        echo "Skipping removal."
    fi
fi 

# --- Pull image --- #
if [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    docker run -d \
        --name $CONTAINER_NAME \
        --restart unless-stopped \
        --volume "$(pwd)":/project \
        --workdir /project \
        "$IMAGE" \
        tail -f /dev/null

    echo "Container '$CONTAINER_NAME' is now running in the background."
    echo "Current directory mounted at /project"
else 
    echo "Container '$CONTAINER_NAME' is already running."
fi 