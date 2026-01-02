All configs are managed through [GNU Stow][stow].

## Automated setup
Run (which may invoke `sudo`):
```bash
<neptune, corellia>.sh
```

## Manual Setup
For user-level configs, run:
```bash
stow -t ~ --restow <cli, neptune, corellia>
```

Optionally, for root configs, run (as root):
```bash
sudo stow -t / --restow neputne-root/
```
To let other users follow the symlinks created by Stow, they need execute
permissions on all parent directories.
In my case, this required
```bash
chmod a+x ~
```

## Neovim
This is in flux.

You need to run `:PaqSync` to install all the vim plugins.

```bash
nvim +PaqSync +qall
```
You need to run things with coc manually to install autocompletes.

[stow]: https://www.gnu.org/software/stow/
