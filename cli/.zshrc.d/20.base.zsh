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

export PATH="$HOME/.local/bin:$PATH"
export SCONSFLAGS="--random $SCONSFLAGS"

setopt prompt_subst

CLONE_SLOTS=(alderaan bespin coruscant dagobah)

clone_tag() {
  local p
  CLONE_TAG=''
  unset SLOT
  for p in ${(s:/:)PWD}; do
    if (( ${CLONE_SLOTS[(Ie)${p##*-}]} )); then
      export SLOT=${p##*-}
      CLONE_TAG="$SLOT "
      return
    fi
  done
}
chpwd_functions+=(clone_tag)
clone_tag

precmd()  { print -Pn "\e]0;[%M %2~]\a" }
preexec() { print -Pn "\e]0;[%M %2~] ${1//\%/%%}\a" }

PS1='%B%F{10}[%m %F{13}${CLONE_TAG}%F{white}%2~%F{10}]$%f%b '
