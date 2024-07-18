#!/bin/bash

scrot "$(echo $HOME)/Pictures/Screenshots/%b%d_%H%M%S.png"

[[ $? -eq 0 ]] && notify-send "Print Screen" "ScreenShot Has Been Taken!"
