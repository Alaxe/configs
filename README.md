All configs are managed through [GNU Stow][stow].

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

## Neovim
This is in flux.

You need to run `:PaqSync` to install all the vim plugins.

```bash
nvim +PaqSync +qall
```
You need to run things with coc manually to install autocompletes.

[stow]: https://www.gnu.org/software/stow/
