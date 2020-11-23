#!/bin/sh

cd $(dirname $0)

# bulgarian dvorak maping from nikolavp
# https://github.com/nikolavp/configs
cat bg-dvorak-phonetic >> /usr/share/X11/xkb/symbols/bg

mkdir -p /etc/X11/xorg.conf.d/
cp ./xorg.conf.d/* /etc/X11/xorg.conf.d/

mkdir -p /etc/X11/xinit/xinitrc.d
cp ./xinitrc.d/* /etc/X11/xinit/xinitrc.d/
chmod u+x /etc/X11/xinit/xinitrc.d/*
