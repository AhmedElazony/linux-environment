#!/bin/bash

# Get the name of the current WiFi connection
current_connection=$(nmcli -t connection show --active | head -n1 | tr -s ':' ' ' | awk '{print $1}')

# Use dmenu to confirm disconnection
chosen_option=$(echo -e "Yes\nNo" | dmenu -i -p "Disconnect from $current_connection?" -c -l 2)

if [ "$chosen_option" == "Yes" ]; then
    nmcli connection down "$current_connection"
    
    # Notify the user
    if [ $? -eq 0 ]; then
        notify-send "WiFi Disconnected" "Successfully disconnected from $current_connection"
    else
        notify-send "WiFi Disconnection Failed" "Failed to disconnect from $current_connection"
    fi
fi

