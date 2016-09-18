#!/bin/sh

cd $(dirname $0);

pacman -Syu --noconfirm $(< packages.txt)
sh ../../apps/xorg/laptop/setup.sh
