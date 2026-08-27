@echo off
title TechnoBank UI Service
setlocal enabledelayedexpansion

:: Setup ANSI Escape Color Codes
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"
set "RESET=%ESC%[0m"
set "BOLD=%ESC%[1m"
set "MAGENTA=%ESC%[35m"
set "GREEN=%ESC%[32m"
set "YELLOW=%ESC%[33m"
set "RED=%ESC%[31m"
set "CYAN=%ESC%[36m"

cls
echo %MAGENTA%%BOLD%===================================================%RESET%
echo %MAGENTA%%BOLD%         TECHNOBANK - REACT FRONTEND UI           %RESET%
echo %MAGENTA%%BOLD%===================================================%RESET%
echo.

:: Check directory
if not exist "technobank-ui" (
    echo %RED%[ERROR] Directory 'technobank-ui' not found!%RESET%
    pause
    exit /b 1
)

echo %YELLOW%[1/2]%RESET% Navigating to UI directory...
cd technobank-ui

:: Check node_modules
if not exist "node_modules\" (
    echo %YELLOW%[WARNING] 'node_modules' not found. Running 'npm install' might be required.%RESET%
)

echo %YELLOW%[2/2]%RESET% Launching Development Server...
echo %CYAN%---------------------------------------------------%RESET%
echo  %BOLD%Service Name :%RESET% TechnoBank UI
echo  %BOLD%Framework    :%RESET% React
echo  %BOLD%Local Access :%RESET% http://localhost:5173
echo %CYAN%---------------------------------------------------%RESET%
echo.

echo %GREEN%%BOLD%[STATUS] Starting React Dev Server... Press Ctrl+C to stop.%RESET%
echo.
npm run dev