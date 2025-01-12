# OpenVPN GUI for Linux

OpenVPN GUI is a graphical user interface application designed for managing OpenVPN connections on Linux systems. The application provides a user-friendly way to connect and disconnect OpenVPN using `.ovpn` configuration files. This program is especially useful for users who want an experience similar to OpenVPN applications on Windows.

## Screenshots
![image](https://github.com/user-attachments/assets/3fd1304f-8352-4baf-bbaa-38a35bbe9fe0)


## Features
- Select and manage OpenVPN `.ovpn` configuration files.
- One-click connect and disconnect buttons.
- Real-time status indicator (Connected/Disconnected).
- Password dialog for `sudo` authentication.
- Windows-like interface with GTK3 for Linux.

## Prerequisites

Before running the application, ensure the following are installed:

1. **Python 3**
2. **Dependencies**:
   ```bash
   python3-gi
   python3-gi-cairo
   gir1.2-gtk-3.0
   openvpn
   ```

## Installation

1. Clone this repo
2. change directory
   ```bash
   cd OpenVPN-GUI
   ```
3. give permissions
   ```bash
   chmod +x opengui-installer.sh
   ```
4. install
   ```bash
   sudo bash opengui-installer.sh
   ```

## Usage

1. Launch the application.
2. Click **Select .ovpn File** to choose your OpenVPN configuration file.
3. Click **Connect** to start the VPN connection. Enter your `sudo` password when prompted.
4. To disconnect, click **Disconnect**.
5. The application will display the connection status in real-time.


## Limitations

- The application requires `sudo` permissions to run OpenVPN.
- Ensure the `.ovpn` file is correctly configured.

## Contribution
Feel free to open issues or submit pull requests for improvements or bug fixes.

---

**Author:** dword32bit


