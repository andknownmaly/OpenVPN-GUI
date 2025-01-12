#!/bin/bash

# Nama script: opengui-installer.sh
# Tujuan: Menginstal dependensi dan menyiapkan OpenGUI

echo "=============================="
echo " OpenGUI Installerv1.0"
echo "                          v1.0"
echo "=============================="

# Memeriksa apakah script dijalankan sebagai root
if [[ $EUID -ne 0 ]]; then
   echo "Mohon jalankan script ini dengan 'sudo' atau sebagai root."
   exit 1
fi

echo "Memulai instalasi dependensi..."

# Perintah untuk menginstal dependensi
sudo apt update && sudo apt install -y python3-gi python3-gi-cairo gir1.2-gtk-3.0 openvpn wget nano

if [[ $? -ne 0 ]]; then
    echo "Terjadi kesalahan saat menginstal dependensi. Instalasi dihentikan."
    exit 1
fi

echo "Semua dependensi berhasil diinstal."

# Mengunduh file opengui
echo "Mengunduh OpenGUI..."
wget -q https://github.com/dword32bit/OpenVPN-GUI/releases/download/1.0/opengui

if [[ $? -ne 0 ]]; then
    echo "Gagal mengunduh opengui. Instalasi dihentikan."
    exit 1
fi

# Membuat direktori untuk ikon
echo "Membuat direktori untuk ikon..."
sudo mkdir -p /opt/opengui

# Mengunduh ikon
echo "Mengunduh ikon OpenVPN..."
wget -q https://github.com/dword32bit/OpenVPN-GUI/releases/download/1.0/openvpn.ico

if [[ $? -ne 0 ]]; then
    echo "Gagal mengunduh ikon. Instalasi dihentikan."
    exit 1
fi

# Memindahkan file ke lokasi yang sesuai
echo "Memindahkan file..."
sudo mv openvpn.ico /opt/opengui
sudo mv opengui /usr/bin/
sudo chmod +x /usr/bin/opengui

# Membuat file desktop entry
echo "Membuat file desktop entry..."
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

# Memberikan izin eksekusi pada file desktop
sudo chmod +x /usr/share/applications/opengui.desktop

echo "Instalasi OpenGUI selesai. Anda sekarang dapat menjalankan OpenGUI dari menu aplikasi."
