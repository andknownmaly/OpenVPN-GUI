#!/bin/bash

echo "=============================="
echo " OpenGUI Installer"
echo "                          v1.0"
echo "=============================="

if [[ $EUID -ne 0 ]]; then
   echo "Mohon jalankan script ini dengan 'sudo' atau sebagai root."
   exit 1
fi

echo "Memulai instalasi dependensi..."
sudo apt install -y python3-gi python3-gi-cairo gir1.2-gtk-3.0 openvpn wget nano

if [[ $? -ne 0 ]]; then
    echo "Terjadi kesalahan saat menginstal dependensi. Instalasi dihentikan."
    exit 1
fi

echo "Semua dependensi berhasil diinstal."

echo "Mengunduh OpenGUI..."
wget -q https://github.com/dword32bit/OpenVPN-GUI/releases/download/1.0/opengui

if [[ $? -ne 0 ]]; then
    echo "Gagal mengunduh opengui. Instalasi dihentikan."
    exit 1
fi

echo "Membuat direktori untuk ikon..."
sudo mkdir -p /opt/opengui

echo "Mengunduh ikon OpenVPN..."
wget -q https://github.com/dword32bit/OpenVPN-GUI/releases/download/1.0/openvpn.ico

if [[ $? -ne 0 ]]; then
    echo "Gagal mengunduh ikon. Instalasi dihentikan."
    exit 1
fi

echo "Memindahkan file..."
sudo mv openvpn.ico /opt/opengui
sudo mv opengui /usr/bin/
sudo chmod +x /usr/bin/opengui

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

sudo chmod +x /usr/share/applications/opengui.desktop

echo "Instalasi OpenGUI selesai. Anda sekarang dapat menjalankan OpenGUI dari menu aplikasi."
