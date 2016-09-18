#!/bin/sh
cd $(dirname $0)

cp xinitrc /etc/X11/xinit/xinitrc
cp xorg.conf.d/* /etc/X11/xorg.conf.d/
