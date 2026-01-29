#!/bin/bash

echo "Installing OpenVPN GUI..."

if command -v apt &> /dev/null; then
    echo "Detected Debian/Ubuntu system"
    sudo apt update
    sudo apt install -y python3-gi python3-gi-cairo gir1.2-gtk-3.0 breeze-gtk-theme
elif command -v dnf &> /dev/null; then
    echo "Detected Fedora/RHEL system"
    sudo dnf install -y python3-gobject gtk3 breeze-gtk
elif command -v pacman &> /dev/null; then
    echo "Detected Arch system"
    sudo pacman -S --noconfirm python-gobject gtk3 breeze-gtk
else
    echo "Warning: Could not detect package manager. Please install python3-gi and gtk3 manually."
fi

echo "Downloading files..."
wget -P /tmp https://github.com/andknownmaly/OpenVPN-GUI/releases/download/2.4/opengui
wget -P /tmp https://github.com/andknownmaly/OpenVPN-GUI/releases/download/2.4/openvpn.ico

sudo mkdir -p /opt/opengui
sudo mkdir -p /usr/local/bin

sudo mv /tmp/opengui /opt/opengui/
sudo mv /tmp/openvpn.ico /opt/opengui/
sudo chmod +x /opt/opengui/opengui

sudo ln -sf /opt/opengui/opengui /usr/local/bin/opengui

cat << EOF | sudo tee /usr/share/applications/opengui.desktop
[Desktop Entry]
Name=OpenVPN
Comment=OpenVPN panel manager
Exec=opengui
Icon=/opt/opengui/openvpn.ico
Terminal=false
Type=Application
Categories=Network;
EOF

echo "Configuring TUN module to autoload..."
echo tun | sudo tee /etc/modules-load.d/tun.conf > /dev/null

echo "Installation complete! You can now run 'opengui' from terminal or find it in your applications menu."
