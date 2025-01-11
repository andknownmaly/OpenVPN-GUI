# OpenVPN GUI

OpenVPN GUI is a graphical user interface application designed for managing OpenVPN connections on Linux systems. The application provides a user-friendly way to connect and disconnect OpenVPN using `.ovpn` configuration files. This program is especially useful for users who want an experience similar to OpenVPN applications on Windows.

## Features
- Select and manage OpenVPN `.ovpn` configuration files.
- One-click connect and disconnect buttons.
- Real-time status indicator (Connected/Disconnected).
- Password dialog for `sudo` authentication.
- Windows-like interface with GTK3 for Linux.

## Prerequisites

Before running the application, ensure the following are installed:

1. **Python 3**
2. **Linux Module** (just install it):
   ```bash
   sudo apt install python3-gi python3-gi-cairo gir1.2-gtk-3.0 openvpn
   ```

## Installation

1. Clone the repository or copy the script to your local machine.
   ```bash
   git clone <repository_url>
   cd <repository_folder>
   ```

2. Run the script directly:
   ```bash
   python3 openvpn_gui.py
   ```

3. (Optional) Create a standalone binary:
   ```bash
   pyinstaller --onefile --name openvpn_gui openvpn_gui.py
   ./dist/openvpn_gui
   ```

## Usage

1. Launch the application.
2. Click **Select .ovpn File** to choose your OpenVPN configuration file.
3. Click **Connect** to start the VPN connection. Enter your `sudo` password when prompted.
4. To disconnect, click **Disconnect**.
5. The application will display the connection status in real-time.

## Screenshots

*Coming soon: Add screenshots of the application.*

## Limitations

- The application requires `sudo` permissions to run OpenVPN.
- Ensure the `.ovpn` file is correctly configured.

## Contribution
Feel free to open issues or submit pull requests for improvements or bug fixes.

---

**Author:** Your Name


