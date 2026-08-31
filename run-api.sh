#!/bin/bash
# Starts the FastAPI backend

RESET='\033[0m'
BOLD='\033[1m'
CYAN='\033[36m'
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
BLUE='\033[34m'

clear
echo -e "${CYAN}${BOLD}===================================================${RESET}"
echo -e "${CYAN}${BOLD}          TECHNOBANK - BACKEND API SERVICE          ${RESET}"
echo -e "${CYAN}${BOLD}===================================================${RESET}"
echo ""

if [ ! -d "technobank-api" ]; then
    echo -e "${RED}[ERROR] Directory 'technobank-api' not found!${RESET}"
    read -p "Press enter to exit..."
    exit 1
fi

echo -e "${YELLOW}[1/3]${RESET} Navigating to backend directory..."
cd technobank-api

if [ ! -f "venv/bin/activate" ]; then
    echo -e "${RED}[ERROR] Virtual environment 'venv' not found in technobank-api!${RESET}"
    echo -e "${YELLOW}[HINT] Create it using: python3 -m venv venv${RESET}"
    read -p "Press enter to exit..."
    exit 1
fi

echo -e "${YELLOW}[2/3]${RESET} Activating virtual environment..."
source venv/bin/activate
echo -e "${GREEN}[OK]${RESET} Virtual environment active."

echo ""
echo -e "${YELLOW}[3/3]${RESET} Initializing FastAPI server..."
echo -e "${BLUE}---------------------------------------------------${RESET}"
echo -e " ${BOLD}Service Name :${RESET} TechnoBank API"
echo -e " ${BOLD}Host Address :${RESET} http://0.0.0.0:8000"
echo -e " ${BOLD}Local Access :${RESET} http://127.0.0.1:8000"
echo -e " ${BOLD}Swagger Docs :${RESET} http://127.0.0.1:8000/docs"
echo -e " ${BOLD}ReDoc Specs  :${RESET} http://127.0.0.1:8000/redoc"
echo -e " ${BOLD}Reload Mode  :${RESET} ${GREEN}ENABLED${RESET}"
echo -e "${BLUE}---------------------------------------------------${RESET}"
echo ""

echo -e "${GREEN}${BOLD}[STATUS] Starting Uvicorn server... Press Ctrl+C to stop.${RESET}"
echo ""
python -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
