echo "[BACKEND] Hello, from entrypoint.sh"
echo "[BACKEND] Detected project name   => $PROJECT_NAME"
echo "[BACKEND] Detected script mode    => ${PROJECT_SCRIPT_MODE:-main}"

# Run Main Script :: Run Web Server
if [ "$PROJECT_SCRIPT_MODE" = "main" ]; then 
    bash entrypoints/ws-server/main.sh
else 
    echo "[BACKEND] ERROR: Unknown script mode     => $PROJECT_SCRIPT_MODE"
fi

