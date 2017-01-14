#!/bin/sh

cd $(dirname $0)

# bulgarian dvorak maping from nikolavp
# https://github.com/nikolavp/configs
cat default/bg-dvorak-phonetic >> /usr/share/X11/xkb/symbols/bg

cp default/xinitrc /etc/X11/xinit/xinitrc

mkdir -p /etc/X11/xorg.conf.d/
cp default/xorg.conf.d/* /etc/X11/xorg.conf.d/

mkdir -p /etc/X11/xinit/xinitrc.d
cp default/xinitrc.d/* /etc/X11/xinit/xinitrc.d
chmod 755 /etc/X11/xinit/xinitrc.d/*
