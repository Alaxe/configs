export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
export CUPS_USER=alexalex
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
export SCONSFLAGS="-j20 $SCONSFLAGS"

export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.local/lib/bsc-2023.07/bin:$PATH"
export BLUESPECDIR="$HOME/.local/lib/bsc-2023.07/"
