#!/bin/bash
# Move the focused window to a workspace within the current environment.
# Usage: move_to_ws.sh <1-10>

current=$(hyprctl activeworkspace -j | grep -oP '"id":\s*\K-?\d+')
env_offset=$(( (current - 1) / 10 * 10 ))
target=$(( env_offset + $1 ))

hyprctl dispatch "hl.dsp.window.move({ workspace = \"$target\" })"
