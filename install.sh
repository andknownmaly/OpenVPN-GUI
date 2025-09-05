#!/bin/bash

echo "Installing OpenVPN GUI..."

# Download files from GitHub releases
echo "Downloading files..."
wget -P /tmp https://github.com/andknownmaly/OpenVPN-GUI/releases/download/2.0/opengui
wget -P /tmp https://github.com/andknownmaly/OpenVPN-GUI/releases/download/2.0/openvpn.ico

# Create directories
sudo mkdir -p /opt/opengui
sudo mkdir -p /usr/local/bin

# Copy and setup files from tmp
sudo mv /tmp/opengui /opt/opengui/
sudo mv /tmp/openvpn.ico /opt/opengui/
sudo chmod +x /opt/opengui/opengui

# Create symlink
sudo ln -sf /opt/opengui/opengui /usr/local/bin/opengui

# Create desktop entry
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

echo "Installation complete! You can now run 'opengui' from terminal or find it in your applications menu."
