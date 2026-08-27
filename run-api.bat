@echo off
title TechnoBank API Service
setlocal enabledelayedexpansion

:: Setup ANSI Escape Color Codes
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"
set "RESET=%ESC%[0m"
set "BOLD=%ESC%[1m"
set "CYAN=%ESC%[36m"
set "GREEN=%ESC%[32m"
set "YELLOW=%ESC%[33m"
set "RED=%ESC%[31m"
set "BLUE=%ESC%[34m"

cls
echo %CYAN%%BOLD%===================================================%RESET%
echo %CYAN%%BOLD%          TECHNOBANK - BACKEND API SERVICE          %RESET%
echo %CYAN%%BOLD%===================================================%RESET%
echo.

:: Check directory
if not exist "technobank-api" (
    echo %RED%[ERROR] Directory 'technobank-api' not found!%RESET%
    pause
    exit /b 1
)

echo %YELLOW%[1/3]%RESET% Navigating to backend directory...
cd technobank-api

:: Check virtual environment
if not exist "venv\Scripts\activate.bat" (
    echo %RED%[ERROR] Virtual environment 'venv' not found in technobank-api!%RESET%
    echo %YELLOW%[HINT] Create it using: python -m venv venv%RESET%
    pause
    exit /b 1
)

echo %YELLOW%[2/3]%RESET% Activating Virtual Environment...
call venv\Scripts\activate.bat
echo %GREEN%[OK]%RESET% Virtual environment active.

echo.
echo %YELLOW%[3/3]%RESET% Initializing FastAPI Server...
echo %BLUE%---------------------------------------------------%RESET%
echo  %BOLD%Service Name :%RESET% TechnoBank API
echo  %BOLD%Host Address :%RESET% http://0.0.0.0:8000
echo  %BOLD%Local Access :%RESET% http://127.0.0.1:8000
echo  %BOLD%Swagger Docs :%RESET% http://127.0.0.1:8000/docs
echo  %BOLD%ReDoc Specs  :%RESET% http://127.0.0.1:8000/redoc
echo  %BOLD%Reload Mode  :%RESET% %GREEN%ENABLED%RESET%
echo %BLUE%---------------------------------------------------%RESET%
echo.

echo %GREEN%%BOLD%[STATUS] Starting Uvicorn server... Press Ctrl+C to stop.%RESET%
echo.
python -m uvicorn app.main:app --reload --host 0.0.0.0 --port 8000