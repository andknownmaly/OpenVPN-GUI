#!/bin/bash

echo "=============================="
echo " OpenGUI Installer"
echo "                          v1.0"
echo "=============================="

if [[ $EUID -ne 0 ]]; then
   echo "Please run this script using 'sudo' or become superuser."
   exit 1
fi

echo "Starting Dependencies installation..."
sudo apt install -y python3-gi python3-gi-cairo gir1.2-gtk-3.0 openvpn wget nano

if [[ $? -ne 0 ]]; then
    echo "Error. Installation Stopped."
    exit 1
fi

echo "All dependencies installed successfully."

echo "Downloading OpenGUI..."
wget -q https://github.com/dword32bit/OpenVPN-GUI/releases/download/1.0/opengui

if [[ $? -ne 0 ]]; then
    echo "Failed to download opengui. Installation stopped."
    exit 1
fi

echo "Create a directory for icons..."
sudo mkdir -p /opt/opengui

echo "Downloading the OpenVPN icon..."
wget -q https://github.com/dword32bit/OpenVPN-GUI/releases/download/1.0/openvpn.ico

if [[ $? -ne 0 ]]; then
    echo "Failed to download icon. Installation stopped."
    exit 1
fi

echo "Move files..."
sudo mv openvpn.ico /opt/opengui
sudo mv opengui /usr/bin/
sudo chmod +x /usr/bin/opengui

echo "Create a desktop entry file..."
cat <<EOF | sudo tee /usr/share/applications/opengui.desktop > /dev/null
[Desktop Entry]
Version=1.0
Name=OpenVPN GUI
Comment=Run the OpenGUI application
Exec=/usr/bin/opengui
Icon=/opt/opengui/openvpn.ico
Terminal=false
Type=Application
Categories=Utility;
EOF

sudo chmod +x /usr/share/applications/opengui.desktop

echo "OpenGUI installation is complete. You can now run OpenGUI from the application menu."
