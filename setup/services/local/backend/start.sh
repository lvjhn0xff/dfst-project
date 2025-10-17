#!/bin/bash
cd /home/project/source 

set -a 
export -p  > /tmp/.env
source /tmp/.env
set +a 

if [ "$PROJECT_RAW_CLI" = "true" ] ; then
    touch .tmp && tail -f .tmp
else
    php artisan serve --host 0.0.0.0 --port 8000
fi 