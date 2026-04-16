#!/usr/bin/env bash

source ./.dfst/runner/runner.base.sh

# --- Extract arguments --- # 
MODE="${1:-development}"
COMMAND="${2:-bash}" 
SCRIPT="${3:-script.sh}"

shift 3

EXTRA_ARGS=("$@") 
ENV_FILE="config/${MODE}.env" 

# --- Validate container --- # 
if [ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Container '$CONTAINER_NAME' is not running. Please run using bash scripts/prepare.sh"
    exit 1
fi

# --- Validate script --- # 
if [ ! -f $SCRIPT ]; then 
    echo "Script '$SCRIPT' not found in current directory."
    exit 1
fi

# --- Validate env file --- # 
if [ ! -f $ENV_FILE ]; then 
    echo "Environment file '$ENV_FILE' not found." 
    exit 1
fi

echo "Loading environment: $MODE"

# --- Load and export environment to current shell ---- #
set -a 
source "$ENV_FILE"
set +a 

# --- Build argument string safely --- #
ARG_STR="" 
for arg in "$MODE" "${EXTRA_ARGS[@]}"; do
    arg_escaped=$(printf '%s' "$arg" | sed "s/'/'\\\\''/g")
    ARGS_STR="$ARGS_STR '$arg_escaped'"
done

# --- Execute inside container --- # 
docker exec -it \
    --workdir /project \
    "$CONTAINER_NAME" \
    bash -c "
        set -a;
        source $ENV_FILE;
        set +a; 
        $COMMAND '$SCRIPT' $ARGS_STR;
    "