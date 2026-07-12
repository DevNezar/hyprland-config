#!/bin/bash

# 1. Clear any dead or stuck background processes safely
killall -9 xdg-desktop-portal-hyprland xdg-desktop-portal 2>/dev/null

# 2. Update DBus environment variables explicitly
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland
systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

# 3. Launch the Hyprland backend manually in the background
/usr/lib/xdg-desktop-portal-hyprland &

# 4. Critical: Wait for the backend to establish its D-Bus presence
sleep 2

# 5. Launch the primary portal manager orchestrator
/usr/lib/xdg-desktop-portal &
