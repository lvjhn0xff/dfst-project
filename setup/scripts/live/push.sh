#!/bin/bash

source setup/scripts/live/@live-context

# Push images to dockerhub.
echo ":: Pushing project images to Dockerhub."
bash docker-compose push