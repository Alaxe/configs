#About
This is the repository with some of my linux configuration files and helper
scripts, which install all or part of them.

#Usage
`setup.sh [platform]` 
Ths installs all of the default configs as well as platform specific ones, if
a valid platform is specified (`desktop` or `laptop`). It should be ran as a
normal user, with sudo privileges to install both local and global configs.

If you want to tinker with it more you can find some lower level scripts in
`/global` and application specific ones in `/apps/<app-name>/`.

#Included software
This is the software for which I have uploaded the configs.
 * git (Edit to use your name and email)
 * i3
 * mpd
 * ncmpcpp 
 * terminator 
 * vim 
 * xorg

#Credit
I've used the bulgarian version of dvorak *bg-dvorak-phonetic* and the 
cyrilic mappings for vim of @nikolavp. Feel free to check out [his
configs](https://github.com/nikolavp/configs).
