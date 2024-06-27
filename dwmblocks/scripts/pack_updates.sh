#!/bin/bash

UPDATES_ICON="🗘"
PACKAGES_ICON="ᗧ"

# Get Updates
updates=$(checkupdates 2> /dev/null | wc -l)

# Get Number of Packages in the system
packages=$(pacman -Q | wc -l)


echo "|$UPDATES_ICON $updates $PACKAGES_ICON $packages| "

