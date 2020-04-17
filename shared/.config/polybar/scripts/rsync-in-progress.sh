#!/bin/bash

TEST=$(ssh 192.168.1.100 ps -aux | grep rsync | wc -l)

if [ $TEST = 0 ]; then
	echo 'Stopped'
else
	echo 'Rsyncing'
fi
