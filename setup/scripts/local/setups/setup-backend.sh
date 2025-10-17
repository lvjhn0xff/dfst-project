#!/bin/bash
source setup/scripts/local/@local-context 

echo ":: Configuring backend." 

# Changing permissions for psysh config. dir.
PSYSH_DIR="/home/project/.config/psysh"
echo ":: ----- Changing permissions for $PSYSH_DIR"
bash template project run-as-root backend chown $PROJECT_USER -R $PSYSH_DIR
