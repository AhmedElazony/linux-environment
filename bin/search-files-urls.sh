#!/bin/bash

# Cache file for recent and all files
CACHE_FILE="$HOME/.cache/full_file_list.txt"
RECENT_FILES_CACHE="$HOME/.cache/recent_file_list.txt"

# Create cache if it doesn't exist or update it if it's older than 1 day
if [ ! -f "$CACHE_FILE" ] || [ "$(find "$CACHE_FILE" -mtime +1)" ]; then
	sudo find / -type f -print 2>/dev/null | grep -vE '^/(proc|sys|dev|run)' >"$CACHE_FILE"
fi

# Update recent file cache based on access time (atime)
if [ ! -f "$RECENT_FILES_CACHE" ] || [ "$(find "$RECENT_FILES_CACHE" -mtime +1)" ]; then
	find / -type f -atime -7 -print 2>/dev/null | grep -vE '^/(proc|sys|dev|run)' >"$RECENT_FILES_CACHE"
fi

# Function to open a file or URL
open_file_or_url() {
	if [[ "$1" =~ ^w?: ]] || [[ "$1" =~ ^https?: ]] || [[ "$1" =~ ^http?: ]]; then
		local url="$1"
		# Remove http:, https:, or w: prefixes if present
		url="${url#http:}"
		url="${url#https:}"
		url="${url#w:}"
		echo "https://$url"
		xdg-open "http://$url" # Always try to open as a URL
	else
		xdg-open "$1"
	fi
}

# Function to check if input is a URL
is_url() {
	[[ "$1" =~ ^(https?|w):[^\s/$.?#].[^\s]*$ ]] && return 0 || return 1
}

# Function to generate dmenu options from file list
generate_dmenu_options() {
	cat "$RECENT_FILES_CACHE" "$CACHE_FILE" | grep -vE '^/(proc|sys|dev|run)' | head -n 100 | dmenu -i -l 10 -c -z 800
}

# Prompt for input and get selection from dmenu
input=$(generate_dmenu_options)

# Open file or URL based on selection
if [ -n "$input" ]; then
	if is_url "$input"; then
		open_file_or_url "$input"
	else
		selected_file=$(grep -i "$input" "$CACHE_FILE" | dmenu -i -l 10 -c -z 800)
		[ -n "$selected_file" ] && open_file_or_url "$selected_file"
	fi
fi
