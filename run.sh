#!/bin/bash
# Starts the API and UI, then opens the app in the browser

cd "$(dirname "$0")"

echo "Launching TechnoBank Backend and Frontend..."

# Try to open each service in its own terminal window
if command -v gnome-terminal &> /dev/null; then
    gnome-terminal --title="TechnoBank API" -- bash -c "./run-api.sh; exec bash"
    gnome-terminal --title="TechnoBank UI" -- bash -c "./run-ui.sh; exec bash"
elif command -v konsole &> /dev/null; then
    konsole --new-tab -p tabtitle="TechnoBank API" -e bash -c "./run-api.sh; exec bash" &
    konsole --new-tab -p tabtitle="TechnoBank UI" -e bash -c "./run-ui.sh; exec bash" &
elif command -v xterm &> /dev/null; then
    xterm -T "TechnoBank API" -e "./run-api.sh" &
    xterm -T "TechnoBank UI" -e "./run-ui.sh" &
else
    # No terminal emulator found, run in background and log to files instead
    echo "No terminal emulator found, running services in background."
    echo "Logs: api.log and ui.log"
    ./run-api.sh > api.log 2>&1 &
    ./run-ui.sh > ui.log 2>&1 &
fi

sleep 3

# Open the UI in the default browser
if command -v xdg-open &> /dev/null; then
    xdg-open http://localhost:5173
elif command -v open &> /dev/null; then
    open http://localhost:5173
else
    echo "Open http://localhost:5173 in your browser."
fi
