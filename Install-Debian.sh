#!/bin/bash

# Function to check if grub-imageboot is installed
check_grub_imageboot() {
    if dpkg -l | grep -q grub-imageboot; then
        echo "grub-imageboot is already installed."
        return 0
    else
        echo "grub-imageboot is not installed."
        return 1
    fi
}

# Function to install grub-imageboot
install_grub_imageboot() {
    sudo apt update
    sudo apt install grub-imageboot
}

# Main script
echo "Checking for grub-imageboot..."

if check_grub_imageboot; then
    read -p "grub-imageboot is installed. Do you want to cancel the script? (y/n): " choice
    if [ "$choice" == "y" ]; then
        echo "Script cancelled."
        exit 0
    fi
else
    read -p "grub-imageboot is not installed. Do you want to install it? (y/n): " choice
    if [ "$choice" == "y" ]; then
        install_grub_imageboot
        clear
        echo "Script is done. grub-imageboot is now installed."
        exit 0
    fi
fi

