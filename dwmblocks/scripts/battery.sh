#!/bin/bash

# Get the battery status
battery=$(cat /sys/class/power_supply/BAT0/capacity)

# Check if the system is Pluged in
pluged=$(cat /sys/class/power_supply/ACAD/online)

# Battery Percentage
if [ "$pluged" -eq 1 ] && [ "$battery" -eq 100 ]; then
	BATTERY_ICON="󰚥"
elif [ "$pluged" -eq 1 ] && [ ! "$battery" -eq 100 ]; then
	BATTERY_ICON="󰂅"
elif [ "$battery" -ge 90 ]; then
	BATTERY_ICON="󰁹"
elif [ "$battery" -ge 80 ]; then
	BATTERY_ICON="󰂂"
elif [ "$battery" -ge 60 ]; then
	BATTERY_ICON="󰂀"
elif [ "$battery" -ge 40 ]; then
	BATTERY_ICON="󰁾"
elif [ "$battery" -ge 20 ]; then
	BATTERY_ICON="󰁼"
elif [ "$battery" -ge 10 ]; then
	BATTERY_ICON="󰁻"
elif [ "$battery" -ge 5 ]; then
	BATTERY_ICON="󰁺"
	notify-send -u critical "Low Battery 󰁺" "Battery is less than 10% \nPlug Your Laptop NOW!"
else
	BATTERY_ICON="󰂎"
fi

echo "$BATTERY_ICON $battery|"
