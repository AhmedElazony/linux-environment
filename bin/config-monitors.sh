#!/bin/bash

# Present options using dmenu
option=$(echo -e "Expanded\nMirrored\nBuilt-In\nExternal" | dmenu -i -p "Select display mode:")

# Configure monitors based on the selected option
if [ "$option" = "Expanded" ]; then
    xrandr --output HDMI-1-0 --mode 1920x1080 --rate 144 --output eDP-1 --mode 1920x1080 --left-of HDMI-1-0
elif [ "$option" = "Mirrored" ]; then
    xrandr --output HDMI-1-0 --mode 1920x1080 --rate 144 --output eDP-1 --same-as HDMI-1-0
elif [ "$option" = "Built-In" ]; then
    xrandr --output eDP-1 --mode 1920x1080 --primary
    xrandr --output HDMI-1-0 --off
elif [ "$option" = "External" ]; then
    xrandr --output HDMI-1-0 --mode 1920x1080 --rate 144 --primary --output eDP-1 --off
else
    echo "No valid option selected."
fi
