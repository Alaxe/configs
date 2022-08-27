#!/bin/bash

cd "$(dirname $0)"

# Autoscale the lockscreen image to the screen resolution
# See https://github.com/i3/i3lock/issues/81
DIMENSIONS=$(xdpyinfo | grep dimensions | cut -d\  -f7)
convert ./images/lockscreen.png -resize $DIMENSIONS \
    ./images/lockscreen-scaled.png
