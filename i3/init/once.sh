#!/bin/bash

if [ -f "~/.config/i3/init/hosts/${HOSTNAME}/once.sh" ];
then
    source ~/.config/i3/init/hosts/${HOSTNAME}/once.sh
fi
