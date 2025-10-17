#!/bin/bash
echo ":: Installing dependencies in front-end sources..." 
echo "----- Installing for web."
bash template project run frontend-web npm install 
echo "----- Installing for mobile." 
bash template project run frontend-mobile npm install

