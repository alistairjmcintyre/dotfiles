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
# feh --bg-fill ~/Pictures/Wallpapers/$(ls ~/Pictures/Wallpapers/ | shuf -n 1) &
# feh --bg-fill ~/Pictures/Wallpapers/dbz.jpg &
feh --bg-fill ~/Pictures/Wallpapers/wallhaven-ymp92k.jpg &
stop_proc compton
compton --respect-prop-shadow &

# consider dunst deprecated in favour of deadd
# stop_proc dunst
# dunst &

stop_proc deadd-notification-center
deadd-notification-center &

stop_proc polybar
polybar $HOSTNAME &

stop_proc conky
conky &
conky -c ~/.config/conky/np.lua &
sleep 2 &
conky -c ~/.config/conky/npart.lua &
sleep 2 &
WEATHER_API_KEY=545c874024b390a54c4ea1e29b78d82e conky -c ~/.config/conky/weather.conf &
sleep 2 &
exec ~/.config/conky/start.sh &

stop_proc glava
glava --desktop

