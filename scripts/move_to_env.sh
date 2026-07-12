#!/bin/bash
current=$(hyprctl activeworkspace -j | jq '.id')
ws_within_env=$(( (current - 1) % 10 + 1 ))
target=$(( ($1 - 1) * 10 + ws_within_env ))
hyprctl dispatch movetoworkspace $target