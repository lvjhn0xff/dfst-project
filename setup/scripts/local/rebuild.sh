#!/bin/bash

source setup/scripts/local/@local-context 

# Reset the project.
bash setup/scripts/local/reset.sh 

# Run first-time-setup script.
bash setup/scripts/local/first-time-setup.sh