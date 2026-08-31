#!/bin/bash
# Starts the React frontend

RESET='\033[0m'
BOLD='\033[1m'
MAGENTA='\033[35m'
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
CYAN='\033[36m'

clear
echo -e "${MAGENTA}${BOLD}===================================================${RESET}"
echo -e "${MAGENTA}${BOLD}         TECHNOBANK - REACT FRONTEND UI           ${RESET}"
echo -e "${MAGENTA}${BOLD}===================================================${RESET}"
echo ""

if [ ! -d "technobank-ui" ]; then
    echo -e "${RED}[ERROR] Directory 'technobank-ui' not found!${RESET}"
    read -p "Press enter to exit..."
    exit 1
fi

echo -e "${YELLOW}[1/2]${RESET} Navigating to UI directory..."
cd technobank-ui

if [ ! -d "node_modules" ]; then
    echo -e "${YELLOW}[WARNING] 'node_modules' not found. Running 'npm install' might be required.${RESET}"
fi

echo -e "${YELLOW}[2/2]${RESET} Launching development server..."
echo -e "${CYAN}---------------------------------------------------${RESET}"
echo -e " ${BOLD}Service Name :${RESET} TechnoBank UI"
echo -e " ${BOLD}Framework    :${RESET} React"
echo -e " ${BOLD}Local Access :${RESET} http://localhost:5173"
echo -e "${CYAN}---------------------------------------------------${RESET}"
echo ""

echo -e "${GREEN}${BOLD}[STATUS] Starting React dev server... Press Ctrl+C to stop.${RESET}"
echo ""
npm run dev
