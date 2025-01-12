#!/bin/bash

echo "=============================="
echo " OpenGUI Uninstaller"
echo "=============================="

if [[ $EUID -ne 0 ]]; then
   echo "Please run this script with 'sudo' or as root."
   exit 1
fi

echo "Starts the OpenGUI removal process..."

if [[ -f /usr/share/applications/opengui.desktop ]]; then
    echo "Delete desktop entries..."
    sudo rm -f /usr/share/applications/opengui.desktop
else
    echo "Desktop entry not found, skip this step."
fi

if [[ -d /opt/opengui ]]; then
    echo "Deleting the /opt/opengui folder..."
    sudo rm -rf /opt/opengui
else
    echo "Folder /opt/opengui not found, skip this step."
fi

if [[ -f /usr/bin/opengui ]]; then
    echo "Removing opengui binaries..."
    sudo rm -f /usr/bin/opengui
else
    echo "Opengui binary not found, skip this step."
fi

echo "The OpenGUI removal process is complete."
