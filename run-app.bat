@echo off
title TechnoBank System Launcher
:: Force script to run from its own directory
cd /d "%~dp0"

echo Launching TechnoBank Backend and Frontend...

start "TechnoBank API" cmd /k "call run-api.bat"
start "TechnoBank UI" cmd /k "call run-ui.bat"

timeout /t 3 /nobreak >nul
start http://localhost:5173

exit