#!/bin/bash

# Determine OS platform
UNAME=$(uname | tr "[:upper:]" "[:lower:]")

# Use $UNAME string to determine the OS
if [ "$UNAME" == "linux" ]; then
    OS="linux"
elif [ "$UNAME" == "darwin" ]; then
    OS="mac"
else
    echo "Unsupported operating system."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null
then
    echo "npm could not be found, installing..."
    # Install npm based on the OS
    if [ "$OS" == "linux" ]; then
        sudo apt-get install npm
    elif [ "$OS" == "mac" ]; then
        brew install npm
    fi
else
    echo "npm is already installed"
fi