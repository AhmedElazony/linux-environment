#!/bin/bash

# Scan for available networks
networks=$(nmcli -t -f SSID dev wifi list | grep -v '^$')

# Use dmenu to select a network
chosen_network=$(echo "$networks" | dmenu -i -p "Select WiFi Network:" -c -l 10)

# If a network is selected
if [ -n "$chosen_network" ]; then
    # Ask for the WiFi password
    wifi_password=$(echo "" | dmenu -i -p "Enter Password:" -c)

    # Connect to the selected network
    nmcli dev wifi connect "$chosen_network" password "$wifi_password"
    
    # Notify the user
    if [ $? -eq 0 ]; then
        notify-send "WiFi Connected" "Successfully connected to $chosen_network"
    else
        notify-send "WiFi Connection Failed" "Failed to connect to $chosen_network"
    fi
fi

