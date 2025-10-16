#!/bin/bash
echo ":: Installing dependencies in front-end sources..." 
echo "----- Installing for web."
bash template project run web npm install 
echo "----- Installing for mobile." 
bash template project run mobile npm install

