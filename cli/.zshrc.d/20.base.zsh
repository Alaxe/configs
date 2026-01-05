export EDITOR=nvim

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true # Might be a performance issue?
#zstyle :compinstall filename '/home/alex/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.cache/histfile
HISTSIZE=10000
SAVEHIST=10000
#setopt autocd
unsetopt beep

bindkey -v
bindkey '^R' history-incremental-search-backward

if [ -n "$VIRTUAL_ENV" ]; then
    source "$VIRTUAL_ENV/bin/activate"
fi

PS1='%B%F{10}[%m%F{white} %2~%F{10}]$%f%b '
# for root
#PS1='%B%F{red}[%m%F{14} %2~%F{red}]#%f%b '

export PATH="$HOME/.local/bin:$PATH"
export SCONSFLAGS="--random $SCONSFLAGS"

precmd () { print -Pn "\e]0;[%M %2~]\a" }
preexec () { print -Pn "\e]0;[%M %2~] $1\a" }
