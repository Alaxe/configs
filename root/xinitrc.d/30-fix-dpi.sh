#!/bin/bash


# Test whether there is a monitor connected
xrandr --listmonitors | grep 'Monitors: 1' &> /dev/null;

if [ $? == 0 ]; then
    # Only laptop screen, use 144 dpi
    echo 'Xft.dpi: 144' | xrdb -merge;
    export DPI_SCALE_FACTOR=1.5
else
    # External monitor connected
    # Use mirrored 1080p
    xrandr --output eDP-1 --mode "1920x1080" --pos "0x0";
    xrandr --output DP-1 --same-as eDP-1;
    xrandr --fb "1920x1080";
fi
