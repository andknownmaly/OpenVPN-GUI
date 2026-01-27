# 🧩 OpenVPN GUI for Linux

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Linux-blue.svg)](https://www.linux.org/)
[![Python](https://img.shields.io/badge/python-3.6%2B-yellow.svg)](https://www.python.org/)
[![GTK](https://img.shields.io/badge/GTK-3.0-orange.svg)](https://www.gtk.org/)

A **modern, lightweight, and user-friendly OpenVPN client GUI for Linux**, built with **GTK and Python**.
Easily manage and connect to multiple VPN profiles with secure password handling and tray integration.

---

<img width="2000" height="1414" alt="OpenVPN GUI Screenshot" src="https://github.com/user-attachments/assets/77d3e376-81fc-49c6-94b0-b28479ce20ed" />

---

## 🚀 Features

* 🧭 Simple and intuitive GTK interface
* 🔐 Secure password handling
* 🗂️ Manage multiple OpenVPN profiles easily
* 🪟 System tray integration for quick access
* 💾 SQLite-backed configuration database
* ⚙️ Works seamlessly on Debian-based distros (Ubuntu, Kali, etc.)

---

## 🧰 Requirements

Make sure these dependencies are installed:

```bash
sudo apt install python3 python3-gi openvpn
```

---

## 🧩 Installation
Just copy this script :D
   ```bash
   sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/andknownmaly/OpenVPN-GUI/main/install.sh)"
   ```
or
   ```bash
   sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/andknownmaly/OpenVPN-GUI/main/install.sh)"
   ```

🧠 *Tip:* The installer automatically configures the TUN module so you don’t need to run `sudo modprobe tun` manually anymore.

---

## 💡 Usage

1. Launch **OpenVPN GUI** from the applications menu or run:

   ```bash
   opengui
   ```
2. Click **“Add”** to import your `.ovpn` file
3. Assign a custom name and connect using the toggle switch
4. Right-click a connection to **edit** or **delete** it

---

## ⚙️ Configuration Details

* All VPN configurations are stored in:

  ```
  ~/.config/openvpn-gui/configs.db
  ```
* The GUI runs OpenVPN using `sudo` for secure network control
* Renaming connections doesn’t affect the original `.ovpn` files

---

## ❌ Uninstallation

To completely remove OpenVPN GUI:

```bash
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/andknownmaly/OpenVPN-GUI/main/uninstall.sh)"
```
or
```bash
sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/andknownmaly/OpenVPN-GUI/main/uninstall.sh)"
```

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!
Feel free to open a [Pull Request](https://github.com/andknownmaly/OpenVPN-GUI/pulls).

---

## 🪪 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.
