All configs are managed through [GNU Stow][stow].

Since this repo uses submodules, after cloning run
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
To users to follow the symlinks created by Stow, they need execute permissions
on all parent directories. In my case, this required
```bash
chmod a+x ~
```

I'm using a modified verison of Bulgarian Dvorak from [nikolavp/configs].
Installing it requires running
```bash
sudo bash -c "cat bg-dvorak-phonetic >> /usr/share/X11/xkb/symbols/bg"
```

[stow]: https://www.gnu.org/software/stow/
[nikolavp/configs]: https://github.com/nikolavp/configs
