#!/bin/bash

echo "=============================="
echo " OpenGUI FULL Uninstaller"
echo "=============================="

if [[ $EUID -ne 0 ]]; then
  echo "Run with sudo."
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

echo "[*] Removing user files..."
rm -rf "$USER_HOME/.config/openvpn-gui"
rm -rf "$USER_HOME/.local/share/opengui"
rm -rf "$USER_HOME/.local/share/applications/opengui.desktop"
rm -rf "$USER_HOME/.cache/opengui"

echo "[*] Updating desktop database..."
update-desktop-database >/dev/null 2>&1 || true

echo "[✓] OpenGUI completely removed. No survivors."
