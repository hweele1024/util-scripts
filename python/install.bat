@echo off
winget install -e --id Python.Python.3.14
python -m pip install --upgrade pip

set /p venv_choice="Install venv? (y/n): "

if /i "%venv_choice%"=="y" (
    echo Setting up venv...
    python -m venv .venv
    call .venv\Scripts\activate.bat
) else if /i "%venv_choice%"=="n" (
    echo Skipping venv.
) else (
    echo Invalid choice. Please enter 'y' or 'n'.
)