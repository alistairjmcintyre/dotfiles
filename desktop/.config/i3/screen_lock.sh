#!/bin/bash

scrot /tmp/screen_locked.png
convert /tmp/screen_locked.png -scale 10% -scale 1000% /tmp/screen_locked.png
i3lock -i /tmp/screen_locked.png

if [ ! -z $1 ]
then
	sleep 5
	systemctl suspend
fi
