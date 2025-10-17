#!/bin/bash

# Run build script of front-ends.
echo ":: Running build scripts of front-ends."
echo ":: ----- Running build script of frontend-web front-end." 
bash template project run frontend-web npm run build 
echo ":: ----- Running build script of frontend-mobile front-end."
bash template project run frontend-mobile npm run build
