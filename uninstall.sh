#!/bin/bash

# Nama script: uninstall.sh
# Tujuan: Menghapus OpenGUI tanpa menghapus dependensi

echo "=============================="
echo " OpenGUI Uninstaller"
echo "=============================="

# Memeriksa apakah script dijalankan sebagai root
if [[ $EUID -ne 0 ]]; then
   echo "Mohon jalankan script ini dengan 'sudo' atau sebagai root."
   exit 1
fi

echo "Memulai proses penghapusan OpenGUI..."

# Menghapus desktop entry
if [[ -f /usr/share/applications/opengui.desktop ]]; then
    echo "Menghapus desktop entry..."
    sudo rm -f /usr/share/applications/opengui.desktop
else
    echo "Desktop entry tidak ditemukan, melewati langkah ini."
fi

# Menghapus folder /opt/opengui
if [[ -d /opt/opengui ]]; then
    echo "Menghapus folder /opt/opengui..."
    sudo rm -rf /opt/opengui
else
    echo "Folder /opt/opengui tidak ditemukan, melewati langkah ini."
fi

# Menghapus binary opengui
if [[ -f /usr/bin/opengui ]]; then
    echo "Menghapus binary opengui..."
    sudo rm -f /usr/bin/opengui
else
    echo "Binary opengui tidak ditemukan, melewati langkah ini."
fi

echo "Proses penghapusan OpenGUI selesai."
