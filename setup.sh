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