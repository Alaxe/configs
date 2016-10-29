#!/bin/sh

cd "$(dirname $0)"

mkdir ~/.config/mpd -p
mkdir ~/.config/mpd/playlists -p

cp mpd.conf ~/.config/mpd
