All configs are managed through [GNU Stow][stow].

Since this repo uses submodules, after cloning it run
```bash
git submodule update --init --recursive
```

## User-Level configs
* Shared configs
```bash
stow -t ~ --restow cli
```
* Just for laptop
```bash
stow -t ~ --restow laptop
```
* Just for Sanchez cluster
```bash
stow -t ~ --restow sanchez
```

## Root-level configs
```bash
sudo stow -t / --restow root/
```
To let other users follow the symlinks created by Stow, they need execute
permissions on all parent directories.
In my case, this required
```bash
chmod a+x ~
```

I'm using a modified verison of Bulgarian Dvorak from [nikolavp/configs].
Installing it requires running
```bash
sudo bash -c "cat bg-dvorak-phonetic >> /usr/share/X11/xkb/symbols/bg"
```

## Neovim
This is in flux.

You need to run `:PlugInstall` to install all the vim plugins.

You need to run things with coc manually to install autocompletes.

[stow]: https://www.gnu.org/software/stow/
[nikolavp/configs]: https://github.com/nikolavp/configs
