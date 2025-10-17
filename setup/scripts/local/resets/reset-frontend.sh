#!/bin/bash

# Remove node_modules/ folder. 
echo ":: Removing node_modules/ folders from front-ends (if there are any)."
echo ":: ----- Removing from web front-end."
bash template project run frontend-web rm -rf node_modules/
echo ":: ----- Removing from mobile front-end." 
bash template project run frontend-mobile rm -rf node_modules/

# Remove dist/ folder 
echo ":: Removing dist/ folders from front-ends (if there are any)."
echo ":: ----- Removing from web front-end."
bash template project run frontend-web rm -rf dist/
echo ":: ----- Removing from mobile front-end." 
bash template project run frontend-mobile rm -rf  dist/