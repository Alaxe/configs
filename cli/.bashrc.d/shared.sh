[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

alias cp="cp -i"                          # confirm before overwriting something
alias rm="rm -i"
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

set -o vi
export EDITOR=nvim
alias vim=nvim

# `--experimental-remote-ip=remote` is necessary for connecting to CSAIL from
# outside of MIT.
alias mosh='mosh --experimental-remote-ip=remote'

zinit() {
    kinit -R -f alexalex@CSAIL.MIT.EDU 2> /dev/null \
        || kinit -f alexalex@CSAIL.MIT.EDU;
}

zssh() {
    zinit;
    mosh --server="~/.local/bin/mosh-server-kerberos" $1.csail.mit.edu;
}

zpush() {
    zinit;
    scp $1 z.csail.mit.edu:~/public_html/private/$2
}


if [ -n "$VIRTUAL_ENV" ]; then
    source "$VIRTUAL_ENV/bin/activate"
fi
