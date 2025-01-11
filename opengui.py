#!/usr/bin/env python3
import os
import subprocess
import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, GdkPixbuf

class OpenVPNGUI(Gtk.Window):
    def __init__(self):
        super().__init__(title="OpenVPN GUI")

        self.config_file = None
        self.process = None
        self.set_border_width(10)
        self.set_default_size(400, 300)

        #self.set_icon_from_file("vpn_icon.png")
        vbox = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        self.add(vbox)
        self.file_button = Gtk.Button(label="Select .ovpn File")
        self.file_button.connect("clicked", self.select_file)
        vbox.pack_start(self.file_button, False, False, 0)
        self.label = Gtk.Label(label="No configuration file selected")
        vbox.pack_start(self.label, False, False, 0)
        hbox_buttons = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        self.connect_button = Gtk.Button(label="Connect")
        self.connect_button.connect("clicked", self.start_vpn)
        self.connect_button.set_sensitive(False)
        hbox_buttons.pack_start(self.connect_button, True, True, 0)
        self.disconnect_button = Gtk.Button(label="Disconnect")
        self.disconnect_button.connect("clicked", self.stop_vpn)
        self.disconnect_button.set_sensitive(False)
        hbox_buttons.pack_start(self.disconnect_button, True, True, 0)
        vbox.pack_start(hbox_buttons, False, False, 0)
        self.status_label = Gtk.Label(label="Status: Disconnected")
        vbox.pack_start(self.status_label, False, False, 0)

    def select_file(self, widget):
        dialog = Gtk.FileChooserDialog(
            title="Select an .ovpn file",
            parent=self,
            action=Gtk.FileChooserAction.OPEN,
        )
        dialog.add_buttons(
            Gtk.STOCK_CANCEL, Gtk.ResponseType.CANCEL,
            Gtk.STOCK_OPEN, Gtk.ResponseType.OK
        )

        filter_ovpn = Gtk.FileFilter()
        filter_ovpn.set_name("OpenVPN Config Files")
        filter_ovpn.add_pattern("*.ovpn")
        dialog.add_filter(filter_ovpn)

        response = dialog.run()
        if response == Gtk.ResponseType.OK:
            self.config_file = dialog.get_filename()
            self.label.set_text(f"Selected File: {os.path.basename(self.config_file)}")
            self.connect_button.set_sensitive(True)
        dialog.destroy()

    def start_vpn(self, widget):
        if self.config_file is None:
            self.show_message("Error", "Please select an .ovpn file first!")
            return

        password = self.ask_password()
        if not password:
            return

        try:
            self.process = subprocess.Popen(
                ["sudo", "-S", "openvpn", self.config_file],
                stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE
            )
            self.process.stdin.write(f"{password}\n".encode())
            self.process.stdin.flush()

            self.status_label.set_text("Status: Connected")
            self.connect_button.set_sensitive(False)
            self.disconnect_button.set_sensitive(True)
            self.show_message("VPN Started", "VPN connection has been started.")
        except Exception as e:
            self.show_message("Error", f"Failed to start VPN:\n{str(e)}")

    def stop_vpn(self, widget):
        if self.process:
            self.process.terminate()
            self.process.wait()
            self.process = None
        self.status_label.set_text("Status: Disconnected")
        self.connect_button.set_sensitive(True)
        self.disconnect_button.set_sensitive(False)
        self.show_message("VPN Stopped", "VPN connection has been stopped.")

    def show_message(self, title, message):
        dialog = Gtk.MessageDialog(
            parent=self,
            flags=0,
            message_type=Gtk.MessageType.INFO,
            buttons=Gtk.ButtonsType.OK,
            text=title,
        )
        dialog.format_secondary_text(message)
        dialog.run()
        dialog.destroy()

    def ask_password(self):
        dialog = Gtk.Dialog(title="Enter Password", parent=self, flags=0)
        dialog.add_buttons(Gtk.STOCK_OK, Gtk.ResponseType.OK, Gtk.STOCK_CANCEL, Gtk.ResponseType.CANCEL)

        label = Gtk.Label(label="Enter your sudo password:")
        entry = Gtk.Entry()
        entry.set_visibility(False)
        entry.set_invisible_char("*")

        box = dialog.get_content_area()
        box.add(label)
        box.add(entry)
        dialog.show_all()

        response = dialog.run()
        password = None
        if response == Gtk.ResponseType.OK:
            password = entry.get_text()
        dialog.destroy()

        return password

if __name__ == "__main__":
    win = OpenVPNGUI()
    win.connect("destroy", Gtk.main_quit)
    win.show_all()
    Gtk.main()
