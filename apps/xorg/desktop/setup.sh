#!/bin/bash
cd $(dirname $0)

cp xinitrc.d/* /etc/X11/xinit/xinitrc.d/
chmod 755 /etc/X11/xinit/xinitrc.d/*
