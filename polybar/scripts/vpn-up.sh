#!/bin/sh

conn=$(nmcli connection show --active | grep vpn | awk '{ print $1 }')
if [ -z $conn ]; then
    echo 'No VPN'
else
    echo $conn
fi