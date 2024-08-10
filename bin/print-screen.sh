#!/bin/bash

# scrot -s "$(echo $HOME)/Pictures/Screenshots/%b%d_%H%M%S.png"

maim -s | xclip -selection clipboard -t image/png

[[ $? -eq 0 ]] && notify-send "Print Screen" "Screenshot Has Been Taken and Copied!"
