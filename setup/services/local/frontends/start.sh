#!/bin/sh
if [ "$PROJECT_RAW_CLI" = "true" ] ; then
    touch .tmp && tail -f .tmp
else
    npm run dev -- --host 0.0.0.0
fi 