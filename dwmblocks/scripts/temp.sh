#!/bin/bash

TEMP_ICON=""

# Temperature
temp=$(cat /sys/class/thermal/thermal_zone0/temp)
temp=$(qalc $temp / 1000 | awk '{print $5}')

echo " $TEMP_ICON $temp°C"

