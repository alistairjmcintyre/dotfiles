#!/bin/bash


i3-msg "workspace number 5;"
# i3-msg "workspace number 5; gaps horizontal current plus 200"
# i3-msg "workspace number 5; gaps vertical current plus 100"
steam &
sleep 12

i3-msg "workspace number 2; append_layout ~/.config/i3/default_workspaces/senna/ws-2.json"
# i3-msg "workspace number 2; gaps horizontal current plus 200"
# i3-msg "workspace number 2; gaps vertical current plus 100"
alacritty &
pavucontrol &
blueman-manager &
sleep 5

i3-msg "workspace number 3; append_layout ~/.config/i3/default_workspaces/senna/ws-3.json"
# i3-msg "workspace number 3; gaps horizontal current plus 200"
# i3-msg "workspace number 3; gaps vertical current plus 100"
firefox &
nixnote2 &
sleep 2

i3-msg "workspace number 4; append_layout ~/.config/i3/default_workspaces/senna/ws-4.json"
# i3-msg "workspace number 4; gaps horizontal current plus 200"
# i3-msg "workspace number 4; gaps vertical current plus 100"
code &
alacritty &
alacritty &
sleep 1

i3-msg "workspace number 1; append_layout ~/.config/i3/default_workspaces/senna/ws-1.json"
# i3-msg "workspace number 1; gaps horizontal current plus 200"
# i3-msg "workspace number 1; gaps vertical current plus 100"
discord &
alacritty -t "GOTOP" -e zsh -i -c '/usr/local/bin/gotop -c monokai -l senna' &
evolution &

conky &