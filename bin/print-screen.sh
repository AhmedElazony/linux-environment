#!/bin/bash

# Define the screenshot file path
file_path=~/Pictures/Screenshots/$(date +%F-%s).png

# Take a screenshot and save it to the file path
maim -s "$file_path"

# Check if the screenshot was successful
if [[ $? -eq 0 && -s "$file_path" ]]; then
	notify-send "Print Screen" "Screenshot Has Been Saved To $file_path and Copied!"
	xclip -selection clipboard -t image/png -i "$file_path"
else
	notify-send "Print Screen" "Screenshot Has Been Canceled"
	# Remove the file if it exists but the operation failed
	[[ -f "$file_path" ]] && rm "$file_path"
fi
