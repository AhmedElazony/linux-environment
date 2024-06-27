#!/bin/bash

WALLPAPERS_DIR="$HOME/wallpapers"

wallpaper=$(ls "$WALLPAPERS_DIR" | dmenu -i -p "Select Wallpaper:" -l 10 -c)

# if a wallpaper was selected
if [ "$wallpaper" ]; then
	feh --bg-scale "$WALLPAPERS_DIR/$wallpaper"
fi
