@echo off
title Advanced System & Network Troubleshooter Launcher

rem Advanced System & Network Troubleshooter Launcher
rem Programmed by: Sumit Ghosh
rem Phone: 7076501101
rem Email: cybersertex@outlook.com

echo ============================================
echo   Advanced System & Network Troubleshooter
echo            Launcher v1.0
echo.
echo    Programmed by: Sumit Ghosh
echo    Phone: 7076501101
echo    Email: cybersertex@outlook.com
echo ============================================
echo.

echo Starting System Troubleshooter GUI...
echo.

rem Check if PowerShell is available
powershell -Command "Write-Host 'PowerShell is available'" >nul 2>&1
if errorlevel 1 (
    echo ERROR: PowerShell is not available on this system.
    echo This application requires PowerShell to run.
    pause
    exit /b 1
)

rem Check if the main PowerShell script exists
if not exist "SystemTroubleshooter.ps1" (
    echo ERROR: SystemTroubleshooter.ps1 not found in the current directory.
    echo Please ensure all files are in the same folder.
    pause
    exit /b 1
)

rem Check if scripts directory exists
if not exist "scripts" (
    echo ERROR: Scripts directory not found.
    echo Please ensure the scripts folder is in the same directory.
    pause
    exit /b 1
)

rem Launch the PowerShell GUI application
echo Launching GUI application...
powershell -ExecutionPolicy Bypass -WindowStyle Hidden -File "SystemTroubleshooter.ps1"

rem Check if there was an error launching the application
if errorlevel 1 (
    echo.
    echo ERROR: Failed to launch the application.
    echo This might be due to execution policy restrictions.
    echo.
    echo Trying alternative launch method...
    powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; & '.\SystemTroubleshooter.ps1'"
)

echo.
echo Application closed.
pause
