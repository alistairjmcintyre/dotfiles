#!/bin/bash

if [[ -f ~/.config/i3/init/hosts/${HOSTNAME}/always.sh ]];
then
    echo "test" >> ~/.testfile
    source ~/.config/i3/init/hosts/${HOSTNAME}/always.sh
fi

function stop_proc() {
    killall -q $1
    while pgrep -x $1 >/dev/null; do sleep 0.5; done
}

stop_proc compton
compton &

stop_proc dunst
dunst &

echo $POLYBAR_ELEMENTS >> ~/.testfile

stop_proc polybar
polybar $HOSTNAME &

# i3-workspace-names-daemon applies FontAwesome icons to WS names
i3-workspace-names-daemon --delimiter " "
# Set my gnome configuration (GTK)
/usr/lib/gnome-settings-daemon/gsd-xsettings
# Set wallpaper
feh --bg-fill ~/Pictures/Wallpapers/$(ls ~/Pictures/Wallpapers/ | shuf -n 1)


