#!/bin/bash


DIMENSIONS=$(xdpyinfo  | grep -oP 'dimensions:\s+\K\S+')

if [ $DIMENSIONS = '1920x1080' ]
then
  export POLYBAR_ELEMENTS="vpn vpn-icon spacer wifi wifi-icon spacer date date-icon spacer"
elif [ $DIMENSIONS = '3440x1440' ]
then
  export POLYBAR_ELEMENTS="vpn vpn-icon spacer wifi wifi-icon spacer memory memory-icon spacer cpu cpu-icon spacer date date-icon spacer"
fi

