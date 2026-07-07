#!/bin/bash
set -euo pipefail

echo "Installing OpenVPN GUI..."

if [[ $EUID -ne 0 ]]; then
  echo "Run this script with sudo."
  exit 1
fi

if command -v apt &> /dev/null; then
    PKG_MANAGER="apt"
    echo "Detected Debian/Ubuntu system"
    apt update
    apt install -y python3-gi python3-gi-cairo gir1.2-gtk-3.0 gir1.2-ayatanaappindicator3-0.1 breeze-gtk-theme
elif command -v dnf &> /dev/null; then
    PKG_MANAGER="dnf"
    echo "Detected Fedora/RHEL system"
    dnf install -y python3-gobject gtk3 libayatana-appindicator-gtk3 breeze-gtk
elif command -v pacman &> /dev/null; then
    PKG_MANAGER="pacman"
    echo "Detected Arch system"
    pacman -S --noconfirm python-gobject gtk3 libayatana-appindicator breeze-gtk
else
    PKG_MANAGER=""
    echo "Warning: Could not detect package manager. Please install python3-gi, gtk3 and libayatana-appindicator3 manually."
fi

echo "Checking OpenVPN installation..."
if command -v openvpn &> /dev/null; then
    echo "OpenVPN is already installed."
else
    echo "OpenVPN not found. Installing..."
    case "$PKG_MANAGER" in
        apt) apt install -y openvpn ;;
        dnf) dnf install -y openvpn ;;
        pacman) pacman -S --noconfirm openvpn ;;
        *) echo "Warning: Could not detect package manager. Please install openvpn manually." >&2 ;;
    esac
fi

echo "Fetching latest release version..."
LATEST_VERSION=$(curl -fsSL https://api.github.com/repos/andknownmaly/OpenVPN-GUI/releases/latest | grep -oP '"tag_name"\s*:\s*"\K[^"]+')

if [[ -z "$LATEST_VERSION" ]]; then
    echo "Error: Could not determine the latest release version." >&2
    exit 1
fi
echo "Latest version: $LATEST_VERSION"

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Downloading files..."
wget -q -P "$TMP_DIR" "https://github.com/andknownmaly/OpenVPN-GUI/releases/download/${LATEST_VERSION}/opengui"
wget -q -P "$TMP_DIR" "https://github.com/andknownmaly/OpenVPN-GUI/releases/download/${LATEST_VERSION}/openvpn.ico"

mkdir -p /opt/opengui
mkdir -p /usr/local/bin

mv "$TMP_DIR/opengui" /opt/opengui/
mv "$TMP_DIR/openvpn.ico" /opt/opengui/
chmod +x /opt/opengui/opengui

ln -sf /opt/opengui/opengui /usr/local/bin/opengui

cat << EOF | tee /usr/share/applications/opengui.desktop > /dev/null
[Desktop Entry]
Name=OpenVPN
Comment=OpenVPN panel manager
Exec=opengui
Icon=/opt/opengui/openvpn.ico
Terminal=false
Type=Application
Categories=Network;
EOF

echo "Configuring TUN module to autoload on boot..."
echo tun | tee /etc/modules-load.d/tun.conf > /dev/null

echo "Loading TUN module for the current session..."
if ! lsmod | grep -q '^tun'; then
    modprobe tun
fi

echo "Installation complete! You can now run 'opengui' from terminal or find it in your applications menu."
