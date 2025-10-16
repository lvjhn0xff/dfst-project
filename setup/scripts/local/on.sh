#!/bin/bash

# Turn on project. 
echo ":: Running containers in detached mode." 
bash docker-compose up -d 

# Updating DNS configuration. 
echo ":: Updating DNS configuration." 
bash template dns update