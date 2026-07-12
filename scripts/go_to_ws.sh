#!/bin/bash
current=$(hyprctl activeworkspace -j | jq '.id')
env_offset=$(( (current - 1) / 10 * 10 ))
hyprctl dispatch workspace $(( env_offset + $1 ))
