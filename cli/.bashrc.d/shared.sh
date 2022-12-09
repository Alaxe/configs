[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

alias cp="cp -i"                          # confirm before overwriting something
alias rm="rm -i"
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

set -o vi
export EDITOR=nvim
alias vim=nvim
alias mosh='mosh --experimental-remote-ip=remote'

alias zinit="kinit -f alexalex@CSAIL.MIT.EDU"
zssh() {
    kinit -R -f alexalex@CSAIL.MIT.EDU 2> /dev/null || zinit
    mosh --server="~/.local/bin/mosh-server-kerberos" $1.csail.mit.edu
}


if [ -n "$VIRTUAL_ENV" ]; then
    source "$VIRTUAL_ENV/bin/activate"
fi
