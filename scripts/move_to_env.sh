#!/bin/bash
# Move the focused window to a workspace in a specific environment, keeping the same position.
# Usage: move_to_env.sh <1-3>

current=$(hyprctl activeworkspace -j | grep -oP '"id":\s*\K-?\d+')
ws_within_env=$(( (current - 1) % 10 + 1 ))
target=$(( ($1 - 1) * 10 + ws_within_env ))

hyprctl dispatch "hl.dsp.window.move({ workspace = \"$target\" })"
