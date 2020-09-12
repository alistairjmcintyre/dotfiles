#!/bin/bash

scrot /tmp/screen_locked.png
convert /tmp/screen_locked.png -scale 10% -scale 1000% /tmp/screen_locked.png

if [ $1 = 'lock' ]
then
	i3lock -i /tmp/screen_locked.png
fi

if [ $1 = 'suspend' ]
then
	i3lock -i /tmp/screen_locked.png
	sleep 5
	systemctl suspend
fi
