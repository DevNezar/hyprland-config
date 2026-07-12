#!/usr/bin/env bash

BAT=/sys/class/power_supply/BAT0

if [ ! -d "$BAT" ]; then
    exit 0
fi

percentage=$(cat "$BAT/capacity")
status=$(cat "$BAT/status")

if [ "$status" = "Charging" ]; then
    icon=""
elif [ "$percentage" -ge 80 ]; then
    icon=""
elif [ "$percentage" -ge 50 ]; then
    icon=""
elif [ "$percentage" -ge 20 ]; then
    icon=""
else
    icon=""
fi

echo "$icon $percentage%"