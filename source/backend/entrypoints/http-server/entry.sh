echo "[BACKEND] Hello, from entrypoint.sh"
echo "[BACKEND] Detected project name   => $PROJECT_NAME"
echo "[BACKEND] Detected script mode    => ${PROJECT_SCRIPT_MODE:-main}"

# Run Main Script :: Run Web Server
if [ "$PROJECT_SCRIPT_MODE" = "main" ]; then 
    bash entrypoints/http-server/main.sh
elif [ "$PROJECT_SCRIPT_MODE" = "setup" ]; then
    bash entrypoints/http-server/setup.sh
else 
    echo "[BACKEND] ERROR: Unknown script mode     => $PROJECT_SCRIPT_MODE"
fi

