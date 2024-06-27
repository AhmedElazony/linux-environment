#!/bin/bash

OBS_ICON=""
TELEGRAM_ICON=""
DISCORD_ICON="󰙯"

# Check if specific applications are running
telegram_status=$(pgrep -f "telegram-desktop" > /dev/null && echo "$TELEGRAM_ICON " || telegram_status="")
discord_status=$(pgrep -f "discord" > /dev/null && echo "$DISCORD_ICON " || discord_status="")
obs_status=$(pgrep -f "obs" > /dev/null && echo "$OBS_ICON " || obs_status="")

# Output the status
echo "$telegram_status$discord_status$obs_status"

