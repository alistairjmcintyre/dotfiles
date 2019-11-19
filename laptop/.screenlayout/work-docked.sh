#!/bin/sh
xrandr --output eDP-1 --off --verbose

xrandr --output DP-1-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-2 --right-of DP-1-1 --mode 1920x1080 --pos 1920x0 --rotate normal --verbose
i3-msg 'workspace 10; move workspace to output DP-1-2'
