#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "Run this script with sudo."
  exit 1
fi

TARGET_USER=${SUDO_USER:-root}
USER_HOME=$(eval echo "~$TARGET_USER")

echo "Target user : $TARGET_USER"
echo "Home dir    : $USER_HOME"
echo

echo "Removing system files..."
rm -rf /opt/opengui
rm -f  /usr/local/bin/opengui
rm -f  /usr/share/applications/opengui.desktop
rm -f  /etc/modules-load.d/tun.conf

echo
read -p "Remove user config ($USER_HOME/.config/openvpn-gui)? [y/N]: " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "Removing user config..."
  rm -rf "$USER_HOME/.config/openvpn-gui"
else
  echo "User config preserved."
fi

echo
read -p "Remove the OpenVPN package as well? [y/N]: " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "[*] Removing OpenVPN package..."
  if command -v apt &> /dev/null; then
    apt remove -y openvpn
  elif command -v dnf &> /dev/null; then
    dnf remove -y openvpn
  elif command -v pacman &> /dev/null; then
    pacman -R --noconfirm openvpn
  else
    echo "Warning: Could not detect package manager. Please remove openvpn manually." >&2
  fi
else
  echo "OpenVPN package preserved."
fi

echo
echo "[*] Updating desktop database..."
update-desktop-database >/dev/null 2>&1 || true

echo "[✓] OpenGUI uninstall completed."
