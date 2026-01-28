#!/bin/bash

echo "Installing OpenVPN GUI..."

echo "Downloading files..."
wget -P /tmp https://github.com/andknownmaly/OpenVPN-GUI/releases/download/2.3/opengui
wget -P /tmp https://github.com/andknownmaly/OpenVPN-GUI/releases/download/2.3/openvpn.ico

sudo mkdir -p /opt/opengui
sudo mkdir -p /usr/local/bin

sudo mv /tmp/opengui /opt/opengui/
sudo mv /tmp/openvpn.ico /opt/opengui/
sudo chmod +x /opt/opengui/opengui

sudo ln -sf /opt/opengui/opengui /usr/local/bin/opengui

cat << EOF | sudo tee /usr/share/applications/opengui.desktop
[Desktop Entry]
Name=OpenVPN GUI
Comment=Simple OpenVPN GUI Client
Exec=opengui
Icon=/opt/opengui/openvpn.ico
Terminal=false
Type=Application
Categories=Network;
EOF

echo "Configuring TUN module to autoload..."
echo tun | sudo tee /etc/modules-load.d/tun.conf > /dev/null

echo "Installation complete! You can now run 'opengui' from terminal or find it in your applications menu."
