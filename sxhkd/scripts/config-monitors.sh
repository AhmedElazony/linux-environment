#!/bin/bash

# Present options using dmenu
option=$(echo -e "Expanded\nMirrored" | dmenu -i -p "Select display mode:")

# Configure monitors based on the selected option
if [ "$option" = "Expanded" ]; then
    xrandr --output HDMI-0 --mode 1920x1080 --rate 144 --output eDP-1-1 --mode 1920x1080 --left-of HDMI-0
elif [ "$option" = "Mirrored" ]; then
    xrandr --output HDMI-0 --mode 1920x1080 --rate 144 --output eDP-1-1 --same-as HDMI-0
else
    echo "No valid option selected."
fi
