#!/bin/bash

RAM_ICON=""

# Get The Ram Usage
ram_usage=$(free -h | grep Mem | awk '{print $3}')


echo " $RAM_ICON  $ram_usage| "
