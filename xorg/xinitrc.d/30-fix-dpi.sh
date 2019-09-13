#!/bin/bash

# This script queries xrandr and if there is a single monitor connected to the
# computer (the built in screen in my laptop) sets the dpi to 144
#
# It's meant to be executed in .i3/config

xrandr --listmonitors | grep 'Monitors: 1' &> /dev/null;

if [ $? == 0 ]; then
    #echo "hello there";
    echo 'Xft.dpi: 144' | xrdb -merge;
fi


