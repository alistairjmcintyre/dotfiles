#!/bin/bash

exec --no-startup-id i3-msg "workspace 1; append_layout ~/.config/i3/default_workspaces/ws-email.json"
exec --no-startup-id i3-msg "workspace 1; gaps horizontal current plus 200"
exec --no-startup-id i3-msg "workspace 1; gaps vertical current plus 100"
exec --no-startup-id i3-msg "workspace 2; append_layout ~/.config/i3/default_workspaces/ws-music.json"
exec --no-startup-id i3-msg "workspace 2; gaps horizontal current plus 200"
exec --no-startup-id i3-msg "workspace 2; gaps vertical current plus 100"
exec --no-startup-id i3-msg "workspace 3; append_layout ~/.config/i3/default_workspaces/ws-browser.json"
exec --no-startup-id i3-msg "workspace 3; gaps horizontal current plus 200"
exec --no-startup-id i3-msg "workspace 3; gaps vertical current plus 100"