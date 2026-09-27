#!/bin/bash
# Switch to a specific environment (group of 10), keeping the same workspace position.
# Usage: go_to_env.sh <1-3>

current=$(hyprctl activeworkspace -j | grep -oP '"id":\s*\K-?\d+')
ws_within_env=$(( (current - 1) % 10 + 1 ))
target=$(( ($1 - 1) * 10 + ws_within_env ))

hyprctl dispatch "hl.dsp.focus({ workspace = \"$target\" })"
