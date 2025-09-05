# OpenVPN GUI

A simple GTK-based OpenVPN client manager for Linux.

---
<img width="2000" height="1414" alt="Teks paragraf Anda" src="https://github.com/user-attachments/assets/77d3e376-81fc-49c6-94b0-b28479ce20ed" />


## Features

- Simple and clean interface
- Easy configuration management
- Multiple VPN profiles support
- System tray integration
- Secure password handling
- Database-backed configuration storage

## Requirements

- Python 3.6+
- GTK 3.0
- OpenVPN
- python3-gi (PyGObject)

## Installation

1. Make sure you have the required dependencies:
   ```bash
   sudo apt install python3 python3-gi openvpn
   ```

2. Clone the repository:
   ```bash
   git clone https://github.com/andknownmaly/OpenVPN-GUI.git
   cd OpenVPN-GUI
   ```

3. Run the installer:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

## Usage

1. Launch OpenVPN GUI from your applications menu or run `opengui` in terminal
2. Click "Add Connection" to add a new VPN configuration
3. Select your .ovpn file and give it a name
4. Use the toggle switch to connect/disconnect
5. Right-click on a configuration to edit or delete it

## Configuration

- VPN configurations are stored in `~/.config/openvpn-gui/configs.db`
- The application uses sudo for OpenVPN connections
- Each configuration can be renamed without affecting the original .ovpn file

## Uninstallation

To remove OpenVPN GUI:

```bash
chmod +x uninstall.sh
./uninstall.sh
```

## License

MIT License

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.


