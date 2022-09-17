[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

alias cp="cp -i"                          # confirm before overwriting something
alias rm="rm -i"
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias mosh='mosh --experimental-remote-ip=remote'
alias kinit="kinit alexalex@CSAIL.MIT.EDU"


set -o vi
export EDITOR=vim


if [ -n "$VIRTUAL_ENV" ]; then
    source "$VIRTUAL_ENV/bin/activate"
fi
