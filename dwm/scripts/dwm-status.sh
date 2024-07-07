#!/bin/sh

CPU_ICON=""
RAM_ICON=""
TEMP_ICON="🌡"
SOUND_ICON="󰕾"
WIFI_ICON=""
UPDATES_ICON="🗘"
PACKAGES_ICON="ᗧ"
BATTERY_ICON="󰁹"
PLUG_ICON="󰚥"
ETHERNET_ICON=""
OBS_ICON=""
TELEGRAM_ICON=""
DISCORD_ICON="󰙯"

while true; do
    # Get the current time
    datetime=$(date "+%a %d-%m-%Y %I:%M")

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
    else
        BATTERY_ICON="󰂎"
    fi

    # Get The Ram Usage
    ram_usage=$(free -h | grep Mem | awk '{print $3}')

    # Get The CPu Usage
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

    # Temperature
    temp=$(cat /sys/class/thermal/thermal_zone0/temp)
    temp=$(qalc $temp / 1000 | awk '{print $5}')

    # Get Sound
    sound=$(amixer sget Master | awk '/%/ {print $5}' | head -n1 | tr -d '[]')
    mute_status=$(amixer sget Master | grep '\[off\]')
    
    # Check if the sound is 0 or mute
    if [ "$sound" = "0%" ] || [ -n "$mute_status" ]; then
	    SOUND_ICON="󰖁"
    else
	    SOUND_ICON="󰕾"
    fi

    # Get the network status
    ethernet=$(cat /sys/class/net/eno1/operstate)
    # Check If the Ethernet is connected or not
    if [ "$ethernet" = "down" ]; then
	    ETHERNET_ICON="󰈂"
    else
	    ETHERNET_ICON="󰈀"
    fi

    # Get The Wifi
    wifi=$(cat /sys/class/net/wlp4s0/operstate)

    # Check if Wifi is connected or not
    if [ "$wifi" = "down" ]; then
	    WIFI_ICON="󰖪"
    else
	    WIFI_ICON=""
    fi

    # Get Updates
    updates=$(checkupdates 2> /dev/null | wc -l)

    # Get Number of Packages in the system
    packages=$(pacman -Q | wc -l)

    # Check if Telegram is running
    if pgrep -f "telegram-desktop" > /dev/null
    then
        telegram_status="$TELEGRAM_ICON "

    else
       telegram_status=""

    fi

    # Check if Discord is running
    if pgrep -f "discord" > /dev/null
    then
        discord_status="$DISCORD_ICON "
    else
       discord_status=""
    
    fi

    # Check if OBS is running
    if pgrep -f "obs" > /dev/null
    then
	obs_status="$OBS_ICON "
    else
        obs_status=""
    fi

    # Set the status bar to the combined information
    xsetroot -name "$datetime;|$UPDATES_ICON $updates $PACKAGES_ICON $packages|$CPU_ICON $cpu_usage% $TEMP_ICON $temp°C $RAM_ICON  $ram_usage|$SOUND_ICON $sound |$ETHERNET_ICON $ethernet |$WIFI_ICON  $wifi |$BATTERY_ICON $battery%|$telegram_status$discord_status$obs_status" 

    # Update every 10 seconds
    sleep 0.06
done

