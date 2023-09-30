export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
export CUPS_USER=alexalex
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
