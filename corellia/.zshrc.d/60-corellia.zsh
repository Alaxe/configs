#!/bin/zsh

source /afs/csail.mit.edu/system/common/etc/zsh/zprofile.csail

tmux() {
    krenew -t -- tmux $@
}

export SCONSFLAGS="-j32 $SCONSFLAGS"
