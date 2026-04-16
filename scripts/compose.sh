#!/usr/bin/env bash

# --- Extract arguments --- #
MODE=$1 
shift 

# --- Check if the next argument is the delimiter "--" --- #
if [[ "$1" == "--" ]]; then
    shift
fi

# --- Base directory --- #
source ./.dfst/base.sh
export CURRENT_USER="$(id -u):$(id -g)"

# --- Pass remaining arguments safely --- #
docker compose \
    --env-file "./config/$MODE.env" \
    --file "./setup/$MODE/docker-compose.yaml" \
    "$@" 