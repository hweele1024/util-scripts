@echo off
:: DISM Health Check and Repair Script
:: Run this script as Administrator

echo Checking for administrator rights...
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Please run this script as Administrator!
    pause
    exit /b
)

echo.
echo ===========================
echo Starting DISM Health Check
echo ===========================

:: 1. Quick health check
echo.
echo Running: DISM /Online /Cleanup-Image /CheckHealth
dism /Online /Cleanup-Image /CheckHealth

:: 2. Detailed scan
echo.
echo Running: DISM /Online /Cleanup-Image /ScanHealth
dism /Online /Cleanup-Image /ScanHealth

:: 3. Repair any issues
echo.
echo Running: DISM /Online /Cleanup-Image /RestoreHealth
dism /Online /Cleanup-Image /RestoreHealth

echo.
echo ===========================
echo DISM Health Check Completed
echo ===========================
pause
