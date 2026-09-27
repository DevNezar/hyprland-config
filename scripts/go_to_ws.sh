#!/bin/bash
# Switch to a workspace within the current environment (group of 10).
# Usage: go_to_ws.sh <1-10>

current=$(hyprctl activeworkspace -j | grep -oP '"id":\s*\K-?\d+')
env_offset=$(( (current - 1) / 10 * 10 ))
target=$(( env_offset + $1 ))

hyprctl dispatch "hl.dsp.focus({ workspace = \"$target\" })"
