#!/bin/bash

chosen=$(grep -v '^#' ~/.config/emoji-list.txt | dmenu -i -l 10 -c -p "Emoji" -fn "JoyPixels-12")

emoji=$(echo "$chosen" | awk '{print $1}')

[ -n "$emoji" ] && echo -n "$emoji" | xsel -ib && xdotool type "$emoji"

notify-send "Clipboard" "$emoji Copied To Clipboard!"
