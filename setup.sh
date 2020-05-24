#!/bin/bash

PWD=$(pwd)
CONFIGDIR=/home/${USER}/.config

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

symlink "replace" /.bashrc              /home/${USER}/.bashrc
symlink "replace" /.Xresources          /home/${USER}/.Xresources
symlink "replace" /compton/compton.conf ${CONFIGDIR}/compton.conf
symlink "replace" /i3                   ${CONFIGDIR}/i3
# symlink "replace" /dunst                ${CONFIGDIR}/dunst
symlink "replace" /rofi                 ${CONFIGDIR}/rofi
symlink "replace" /polybar              ${CONFIGDIR}/polybar
symlink "replace" /powerline/config     ${CONFIGDIR}/powerline
symlink "replace" /gotop                ${CONFIGDIR}/gotop
symlink "replace" /alacritty            ${CONFIGDIR}/alacritty
symlink "replace" /gtk                  /home/${USER}/.themes
symlink "replace" /spicetify		    ${CONFIGDIR}/spicetify/Themes
symlink "replace" /.zshrc               /home/${USER}/.zshrc
symlink "replace" /.p10k.zsh            /home/${USER}/.p10k.zsh
symlink "replace" /conky                ${CONFIGDIR}/conky