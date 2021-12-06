#!/bin/bash

if xrandr | grep "HDMI-A-0 connected";
then
    xrandr --output HDMI-A-0 --auto --primary --right-of eDP
else
    xrandr --output HDMI-A-0 --off --output eDP --primary
fi
