#!/bin/sh

xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-2 --right-of eDP-1 --mode 1920x1080 --pos 1920x0 --rotate normal --verbose
i3-msg 'workspace 10; move workspace to output HDMI-2'
