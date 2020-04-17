#!/bin/bash

PWD=$(pwd)

function symlink() {
    action=$1
    src="${PWD}${2}"
    dest=$3

    echo "$src => $dest"

    if [ $action = 'replace' ]; then
        rm $dest
        ln -s ${src} $dest
    fi
}

symlink "replace" /compton/compton.conf /home/${USER}/.config/compton.conf
symlink "replace" /i3                   /home/${USER}/.config/i3
symlink "replace" /dunst                /home/${USER}/.config/dunst
symlink "replace" /rofi                 /home/${USER}/.config/rofi
symlink "replace" /polybar              /home/${USER}/.config/polybar