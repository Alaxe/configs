# About
This is the repository with some of my linux configuration files and some helper
scripts.

## Included configurations
 * i3wm
 * X11
 * vim
 * ncmpcpp
 * mpd
 * git

## Dvorak phonetic
I've used (and modified) a bulgarian version of dvorak *bg-dvorak-phonetic* and
cyrilic mappings for vim created by @nikolavp. Feel free to check out [his
configs](https://github.com/nikolavp/configs).

## Root stows
```bash
sudo bash -c "cat bg-dvorak-phonetic >> /usr/share/X11/xkb/symbols/bg"
```
