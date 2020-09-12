#!/bin/bash

[[ -f ~/.config/i3/init/hosts/${HOSTNAME}/once.sh ]] && echo $HOSTNAME



if [[ -f ~/.config/i3/init/hosts/${HOSTNAME}/once.sh ]]
then
     exec ~/.config/i3/init/hosts/${HOSTNAME}/once.sh
fi
