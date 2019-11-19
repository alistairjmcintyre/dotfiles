#!/bin/sh
xrandr --output eDP-1 --off --verbose

xrandr --output DP-1 --primary --mode 3440x1440 --pos 0x0 --rotate normal --verbose
