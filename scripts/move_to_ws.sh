#!/bin/bash
current=$(hyprctl activeworkspace -j | jq '.id')
env_offset=$(( (current - 1) / 10 * 10 ))
target=$(( env_offset + $1 ))
hyprctl dispatch movetoworkspace $target