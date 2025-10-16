#!/bin/bash

# Run build script of front-ends.
echo ":: Running build scripts of front-ends."
echo ":: ----- Running build script of web front-end." 
bash template project run web npm run build 
echo ":: ----- Running build script of mobile front-end."
bash template project run mobile npm run build
