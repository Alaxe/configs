export EDITOR=nvim
alias vim=nvim

unsetopt beep
bindkey -v

autoload -Uz compinit
compinit

PS1='%B%F{red}[%m%F{14} %2~%F{red}]#%f%b '

precmd () { print -Pn "\e]0;[%M %2~]\a" }
preexec () { print -Pn "\e]0;[%M %2~] $1\a" }
