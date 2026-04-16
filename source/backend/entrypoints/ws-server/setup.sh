echo "[BACKEND] Setting up back-end.."

# Check for the directory 'env', not the 'activate' file itself
if [ ! -d "env" ]; then 
    echo "[BACKEND] No virtual environment yet, creating one..."
    # The syntax is: python3 -m venv <directory_name>
    python3 -m venv env
else 
    echo "[BACKEND] Virtual environment detected, skipping creation..."
fi 

echo "[BACKEND] Activating virtual environment..."
source env/bin/activate

echo "[BACKEND] Installing Flask..."
yes | python3 -m pip uninstall flask 
yes | python3 -m pip install flask
