#!/bin/bash

if [[ -f ~/.config/i3/init/hosts/${HOSTNAME}/always.sh ]];
then
    source ~/.config/i3/init/hosts/${HOSTNAME}/always.sh
fi

function stop_proc() {
    killall -q $1
    while pgrep -x $1 >/dev/null; do sleep 1; done
}

# i3-workspace-names-daemon applies FontAwesome icons to WS names
i3-workspace-names-daemon --delimiter " " &
# Set my gnome configuration (GTK)
/usr/lib/gnome-settings-daemon/gsd-xsettings &
# Set wallpaper
feh --bg-fill ~/Pictures/Wallpapers/$(ls ~/Pictures/Wallpapers/ | shuf -n 1) &
feh --bg-fill ~/Pictures/Wallpapers/dbz.jpg &
stop_proc compton
compton --respect-prop-shadow &

# consider dunst deprecated in favour of deadd
# stop_proc dunst
# dunst &

stop_proc deadd-notification-center
deadd-notification-center &

stop_proc polybar
polybar $HOSTNAME &




