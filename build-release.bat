@echo off
title Building TechnoBank Hermes Portable Release...
cd /d "%~dp0"

echo [1/3] Building React Frontend...
cd technobank-ui
call npm run build
cd ..

echo.
echo [2/3] Activating Python Virtual Environment...
call technobank-api\venv\Scripts\activate.bat
pip install pyinstaller >nul 2>&1

echo.
echo [3/3] Packaging into Portable Executable...
pyinstaller --noconfirm --onedir --onedir ^
    --name "TechnoBank Hermes" ^
    --add-data "technobank-ui/dist;technobank-ui-dist" ^
    technobank-api/app/main.py

echo.
echo ====================================================
echo SUCCESS: Portable App created in "dist\TechnoBank Hermes"
echo ====================================================
pause