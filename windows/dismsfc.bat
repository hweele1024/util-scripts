@echo off
:: ==========================================
:: Windows Health Check Script: DISM + SFC
:: Run this script as Administrator
:: Logs results to DISM_SFC_Log.txt
:: ==========================================

:: Check for admin rights
echo Checking for administrator rights...
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Please run this script as Administrator!
    pause
    exit /b
)

:: Create or clear log file
set LOGFILE=%~dp0DISM_SFC_Log.txt
echo Windows Health Check Log > "%LOGFILE%"
echo Start Time: %date% %time% >> "%LOGFILE%"
echo ================================ >> "%LOGFILE%"

:: --- Step 1: DISM Health Check and Repair ---
echo.
echo ================================
echo Step 1: Running DISM Health Check
echo ================================
echo Running DISM /Online /Cleanup-Image /CheckHealth
echo --- DISM /CheckHealth --- >> "%LOGFILE%"
dism /Online /Cleanup-Image /CheckHealth >> "%LOGFILE%" 2>&1

echo.
echo Running DISM /Online /Cleanup-Image /ScanHealth
echo --- DISM /ScanHealth --- >> "%LOGFILE%"
dism /Online /Cleanup-Image /ScanHealth >> "%LOGFILE%" 2>&1

echo.
echo Running DISM /Online /Cleanup-Image /RestoreHealth
echo --- DISM /RestoreHealth --- >> "%LOGFILE%"
dism /Online /Cleanup-Image /RestoreHealth >> "%LOGFILE%" 2>&1

:: --- Step 2: System File Checker ---
echo.
echo ================================
echo Step 2: Running SFC Scan
echo ================================
echo Running sfc /scannow
echo --- SFC /scannow --- >> "%LOGFILE%"
sfc /scannow >> "%LOGFILE%" 2>&1

:: --- Completion ---
echo.
echo ================================
echo Health Check Completed
echo Log saved to: "%LOGFILE%"
echo End Time: %date% %time% >> "%LOGFILE%"
echo ================================ >> "%LOGFILE%"
pause
