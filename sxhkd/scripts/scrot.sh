#!/bin/bash

scrot -s "$(echo $HOME)/Pictures/Screenshots/%b%d_%H%M%S.png"

notify-send "Print Screen" "ScreenShot Has Been Taken!"
