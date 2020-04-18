#!/bin/bash


i3-msg "workspace 1; append_layout ~/.config/i3/default_workspaces/ws-email.json"
i3-msg "workspace 1; gaps horizontal current plus 200"
i3-msg "workspace 1; gaps vertical current plus 100"
i3-msg "workspace 2; append_layout ~/.config/i3/default_workspaces/ws-music.json"
i3-msg "workspace 2; gaps horizontal current plus 200"
i3-msg "workspace 2; gaps vertical current plus 100"
i3-msg "workspace 3; append_layout ~/.config/i3/default_workspaces/ws-browser.json"
i3-msg "workspace 3; gaps horizontal current plus 200"
i3-msg "workspace 3; gaps vertical current plus 100"