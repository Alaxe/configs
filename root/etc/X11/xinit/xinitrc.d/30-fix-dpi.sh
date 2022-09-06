#!/bin/bash

xrandr --listmonitors | grep 'HDMI-2' &> /dev/null;
hdmi=$?

xrandr --listmonitors | grep 'Monitors: 2' &> /dev/null;
dp=$?

if [ $hdmi == 0 ]; then
    # Use mirrored 4K 144 dpi
    xrandr --fb "3840x2160";
    xrandr --output HDMI-2 --mode "3840x2160";
    xrandr --output eDP-1 --scale-from "3840x2160";
    echo 'Xft.dpi: 144' | xrdb -merge;
    export DPI_SCALE_FACTOR=1.5
elif [ $dp == 0 ]; then
    # Use mirrored 1080p
    xrandr --output eDP-1 --mode "1920x1080" --pos "0x0";
    xrandr --output DP-1 --same-as eDP-1;
    xrandr --fb "1920x1080";
else
    # Only laptop screen, use 144 dpi
    echo 'Xft.dpi: 144' | xrdb -merge;
    export DPI_SCALE_FACTOR=1.5
fi
