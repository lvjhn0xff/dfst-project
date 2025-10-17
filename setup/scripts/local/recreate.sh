#!/bin/bash

source setup/scripts/local/@local-context 

# Uncreate project.
bash setup/scripts/local/uncreate.sh 

# Recreate project again. 
bash setup/scripts/create.sh