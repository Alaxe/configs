#!/bin/sh
cd $(dirname $0)

cp xorg.conf.d/* /etc/X11/xorg.conf.d/
cp xintirc.d/* /etc/X11/xinit/xinitrc.d/
chmod 755 /etc/X11/xinit/xinitrc.d/*
