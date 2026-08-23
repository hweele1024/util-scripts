#!/usr/bin/env bash
set -euo pipefail

err_msg1="Invalid choice. Please enter '1' or '2'."
err_msg2="Invalid choice. Please enter 'y' or 'n'."

read -p "Enter Distro (1 = arch / 2 = ubuntu/debian): " distro_choice
if [ "$distro_choice" = "1" ]; then
    sudo pacman -Syu --noconfirm python python-pipx
elif [ "$distro_choice" = "2" ]; then
    sudo apt update
    sudo apt install -y python3 python3-pip
else
    echo "$err_msg1"
    exit 1
fi

read -p "Install venv? (y/n): " venv_choice
if [ "$venv_choice" = "y" ]; then
    echo "Setting up venv..."
    python3 -m venv .venv
    source .venv/bin/activate
elif [ "$venv_choice" = "n" ]; then
    echo "Skipping venv."
else
    echo "$err_msg2"
    exit 1
fi