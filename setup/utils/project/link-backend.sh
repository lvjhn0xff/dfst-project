#!/bin/bash

BASE_PATH1=../setup/utils/project/backends/$1
BASE_PATH2=../../setup/utils/project/backends/$1
BASE_PATH3=../../../setup/utils/project/backends/$1

# Link services.
rm -rf ./setup/services/local/backend
ln -s $BASE_PATH3/services/local/backend ./setup/services/local

rm -rf ./setup/services/live/backend
ln -s $BASE_PATH3/services/live/backend ./setup/services/live

# Link Caddyfile.
rm -rf ./setup/services/local/router/http/sites/Caddyfile.backend
ln -s $BASE_PATH3/services/local/router/http/sites/Caddyfile.backend \
      ./setup/services/local/router/http/sites/Caddyfile.backend

rm -rf ./setup/services/live/router/http/sites/Caddyfile.backend
ln -s $BASE_PATH3/services/live/router/http/sites/Caddyfile.backend \
      ./setup/services/live/router/http/sites/Caddyfile.backend

# Link source.
rm -f ./source/backend
ln -s $BASE_PATH1/source \
      ./source/backend
