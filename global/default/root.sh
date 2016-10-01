#!/bin/sh
cd "$(dirname "$0")"

pacman -Syu --noconfirm $(< packages.txt)

sh ../../apps/vim/setup.sh
sh ../../apps/xorg/setup.sh

