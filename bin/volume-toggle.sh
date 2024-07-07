#!/bin/bash

amixer sset Master toggle && pkill -RTMIN+10 dwmblocks 
