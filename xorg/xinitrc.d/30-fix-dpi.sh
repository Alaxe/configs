#!/bin/bash


# Test whether there is a monitor connected
xrandr --listmonitors | grep 'Monitors: 1' &> /dev/null;

if [ $? == 0 ]; then
    # Only laptop screen, use 144 dpi
    echo 'Xft.dpi: 144' | xrdb -merge;
    export DPI_SCALE_FACTOR=1.5
else
    # External monitor connected
    # Use mirrored 4K 144 dpi
    xrandr --fb "3840x2160";
    xrandr --output DP1 --mode "3840x2160";
    xrandr --output eDP1 --scale-from "3840x2160";
    echo 'Xft.dpi: 144' | xrdb -merge;
    export DPI_SCALE_FACTOR=1.5
fi
