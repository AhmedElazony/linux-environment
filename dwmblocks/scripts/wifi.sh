#!/bin/bash

# Get The Wifi
wifi=$(cat /sys/class/net/wlp4s0/operstate)

# Check if Wifi is connected or not
if [ "$wifi" = "down" ]; then
    WIFI_ICON="󰖪"
else
    WIFI_ICON=""
fi

echo " $WIFI_ICON  $wifi| "
