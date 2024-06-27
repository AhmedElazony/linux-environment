#!/bin/bash

# Get the network status
ethernet=$(cat /sys/class/net/eno1/operstate)

# Check If the Ethernet is connected or not
if [ "$ethernet" = "down" ]; then
    ETHERNET_ICON="󰈂"
else
    ETHERNET_ICON="󰈀"
fi

echo "$ETHERNET_ICON $ethernet"
