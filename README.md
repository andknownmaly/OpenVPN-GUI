# 🧩 OpenVPN GUI for Linux

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Linux-blue.svg)](https://www.linux.org/)
[![Python](https://img.shields.io/badge/python-3.6%2B-yellow.svg)](https://www.python.org/)
[![GTK](https://img.shields.io/badge/GTK-3.0-orange.svg)](https://www.gtk.org/)

A **modern, lightweight, and user-friendly OpenVPN client GUI for Linux**, built with **GTK and Python**.
Easily manage and connect to multiple VPN profiles with secure password handling.

---

<img width="1000" height="565" alt="image" src="https://github.com/user-attachments/assets/7731b64a-a0f7-4fcd-9734-1e5fc5260b4b" />
nb: theme = Midnight-NightGreen

---

## 🚀 Features

* 🧭 Simple and intuitive GTK interface
* 🔐 Secure password handling
* 🗂️ Manage multiple OpenVPN profiles easily
* 💾 SQLite-backed configuration database
* 🎨 **Auto-theme detection** - supports all Desktop Environments (GNOME, KDE, XFCE, etc.)
* 🌓 **Dark/Light mode** with automatic detection
* ⚡ **Optimized performance** - stable for long-term usage
* ⚙️ Works seamlessly on all major Linux distributions

---

## 🧰 Requirements

```bash
sudo apt install python3 python3-gi openvpn
```

💡 **For KDE Users:** Also install `breeze-gtk-theme` for better theme integration!

---

## 🧩 Installation

**Quick Install:**
```bash
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/andknownmaly/OpenVPN-GUI/main/install.sh)"
```
or
```bash
sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/andknownmaly/OpenVPN-GUI/main/install.sh)"
```

🧠 *Tip:* The installer automatically installs dependencies and configures the TUN module.

---

## 💡 Usage

1. Launch **OpenVPN GUI** from the applications menu or run:

   ```bash
   opengui
   ```
2. Click **"Add"** to import your `.ovpn` file
3. Assign a custom name and connect using the toggle switch
4. Right-click a connection to **edit** or **delete** it

---

## ⚙️ Configuration Details

* All VPN configurations are stored in:

  ```
  ~/.config/openvpn-gui/configs.db
  ```
* The GUI runs OpenVPN using `sudo` for secure network control
* Renaming connections doesn't affect the original `.ovpn` files

---

## 🎨 Theme Support

This app automatically adapts to your desktop environment theme!

**Supported:** GNOME, KDE Plasma, XFCE, Cinnamon, MATE, and more.

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
