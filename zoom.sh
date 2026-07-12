#!/bin/bash
# Usage: zoom.sh +0.25   or   zoom.sh -0.25

STEP="$1"
MIN=1.0
MAX=3.0

current=$(hyprctl getoption cursor:zoom_factor -j | jq -r '.float')
new=$(echo "$current $STEP" | awk '{printf "%.2f", $1 + $2}')

# clamp
new=$(echo "$new $MIN" | awk '{print ($1 < $2) ? $2 : $1}')
new=$(echo "$new $MAX" | awk '{print ($1 > $2) ? $2 : $1}')

hyprctl keyword cursor:zoom_factor "$new"
