#!/bin/bash

# Reset project. 
echo ":: Removing containers, networks, volumes, and images." 
bash docker-compose down --rmi all -v