#!/bin/bash

if [[ -f ~/.config/i3/init/hosts/${HOSTNAME}/always.sh ]];
then
    source ~/.config/i3/init/hosts/${HOSTNAME}/always.sh
fi

function stop_proc() {
    killall -q $1
    while pgrep -x $1 >/dev/null; do sleep 1; done
}

# Set wallpaper
feh --bg-fill /usr/share/backgrounds/bigsur.jpg &

stop_proc compton
compton --respect-prop-shadow &


stop_proc dunst
dunst &

stop_proc polybar
polybar $HOSTNAME &

stop_proc xob
ps -aux | grep '[p]ulse-volume' | tr -s " " | cut -d " " -f 2 | xargs -I{} kill -9 {}
~/.i3/init/pulse-volume-watcher.py | xob
