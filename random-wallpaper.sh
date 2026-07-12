#!/bin/bash
kill swaybg
wallpaper=$(find ~/Other/Wallpapers -type f | shuf -n 1)
swaybg -i "$wallpaper" -m fill
