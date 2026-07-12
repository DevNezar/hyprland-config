#!/bin/bash

# Give the compositor a split second to settle
sleep 1

# Stop all running instances gracefully
systemctl --user stop xdg-desktop-portal xdg-desktop-portal-hyprland

# Force-kill anything hanging around
killall -9 xdg-desktop-portal xdg-desktop-portal-hyprland 2>/dev/null

# Start the Hyprland portal first
systemctl --user start xdg-desktop-portal-hyprland

# Critical pause: let XDPH register with DBus before starting the main portal
sleep 1

# Start the main portal orchestrator
systemctl --user start xdg-desktop-portal
