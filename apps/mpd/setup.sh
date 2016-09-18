#!/bin/sh

cd "$(dirname $0)"

mkdir ~/.config/mpd -p
cp mpd.conf ~/.config/mpd
