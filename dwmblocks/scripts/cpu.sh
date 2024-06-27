#!/bin/bash

CPU_ICON=""

# Get The CPu Usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

echo "$CPU_ICON $cpu_usage"

