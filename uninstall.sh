#!/bin/bash

echo "=============================="
echo " OpenGUI Uninstaller"
echo "=============================="

if [[ $EUID -ne 0 ]]; then
   echo "Please run this script with 'sudo' or as root."
   exit 1
fi

echo "Starts the OpenGUI removal process..."

if [[ -d /opt/opengui ]]; then
    echo "Deleting the /opt/opengui folder..."
    sudo rm -rf /opt/opengui
else
    echo "Folder /opt/opengui not found, skip this step."
fi

if [[ -f /usr/local/bin/opengui ]]; then
    echo "Removing opengui binaries..."
    sudo rm -f /usr/local/bin/opengui
else
    echo "Opengui binary not found, skip this step."
fi

if [[ -f /usr/share/applications/opengui.desktop ]]; then
    echo "Delete desktop entries..."
    sudo rm -f /usr/share/applications/opengui.desktop
else
    echo "Desktop entry not found, skip this step."
fi

read -p "Remove user configurations? (y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm -rf ~/.config/openvpn-gui
fi

echo "The OpenGUI removal process is complete."
