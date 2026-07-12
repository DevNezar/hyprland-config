#!/bin/bash
current=$(hyprctl activeworkspace -j | jq '.id')
ws_within_env=$(( (current - 1) % 10 + 1 ))
hyprctl dispatch workspace $(( ($1 - 1) * 10 + ws_within_env ))
