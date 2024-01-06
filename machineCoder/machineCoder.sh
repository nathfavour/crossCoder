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

# Check if node is installed
if ! command -v node &> /dev/null
then
    echo "node could not be found, installing..."
    # Install node based on the OS
    if [ "$OS" == "linux" ]; then
        sudo apt-get install nodejs
    elif [ "$OS" == "mac" ]; then
        brew install node
    fi
else
    echo "node is already installed"
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

echo "about to run a localserver for syncing your files/repositories"
echo "please visit any of these links on your destination computer:"

# Initialize ezshare
command ezshare

