#!/bin/bash

SOUND_ICON="󰕾"

vol=$(amixer sget Master | awk '/%/ {print $5}' | head -n1 | tr -d '[]')
muted=$(amixer sget Master | grep '\[off\]')

if [ "$vol" = "0%" ] || [ -n "$muted" ]; then
	SOUND_ICON="󰖁"
else
	SOUND_ICON="󰕾"
fi

echo "$SOUND_ICON $vol| "
