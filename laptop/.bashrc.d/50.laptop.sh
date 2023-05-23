#!/bin/bash

# Install Ruby Gems to ~/gems
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

export CUPS_USER=alexalex
export XDG_DATA_HOME=$HOME/.local/share

alias hdmi-present="xrandr --output HDMI-2 --auto --scale-from 1920x1080 --right-of eDP-1"

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

alias np='nano -w PKGBUILD'

xhost +local:root > /dev/null 2>&1
