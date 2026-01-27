#!/bin/bash

echo "=============================="
echo " OpenGUI Uninstaller"
echo "=============================="

if [[ $EUID -ne 0 ]]; then
  echo "Run this script with sudo."
  exit 1
fi

TARGET_USER=${SUDO_USER:-root}
USER_HOME=$(eval echo "~$TARGET_USER")

echo "[*] Target user : $TARGET_USER"
echo "[*] Home dir    : $USER_HOME"
echo

echo "[*] Removing system files..."
rm -rf /opt/opengui
rm -f  /usr/local/bin/opengui
rm -f  /usr/share/applications/opengui.desktop
rm -f  /usr/share/icons/hicolor/*/apps/opengui.*
rm -f  /usr/share/pixmaps/opengui.*

echo
read -p "Remove user config ($USER_HOME/.config/openvpn-gui)? [y/N]: " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "[*] Removing user config..."
  rm -rf "$USER_HOME/.config/openvpn-gui"
else
  echo "[*] User config preserved."
fi

echo
echo "[*] Updating desktop database..."
update-desktop-database >/dev/null 2>&1 || true

echo "[✓] OpenGUI uninstall completed."
