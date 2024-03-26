alias diff='diff --color'
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias cp="cp -i"           # confirm before overwriting something
alias rm="rm -i"
alias df='df -h'           # human-readable sizes
alias free='free -m'       # show sizes in MB
alias sudo='sudo '       # so that aliases still work

alias vim=nvim

# # ex - archive extractor
# # usage: ex <file>
ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# `--experimental-remote-ip=remote` is necessary for connecting to CSAIL from
# outside of MIT.
alias mosh='mosh --experimental-remote-ip=remote'

zinit() {
    kinit -R -f alexalex@CSAIL.MIT.EDU 2> /dev/null \
        || kinit -f alexalex@CSAIL.MIT.EDU -l 60d;
}

zssh() {
    zinit;
    mosh --server="~/.local/bin/mosh-server-kerberos" $1.csail.mit.edu ${@:2}
}

zpush() {
    zinit;
    scp $1 z.csail.mit.edu:~/public_html/private/$2
}
