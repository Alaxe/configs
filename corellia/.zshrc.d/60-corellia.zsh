#!/bin/zsh

source /afs/csail.mit.edu/system/common/etc/zsh/zprofile.csail

tmux() {
    krenew -t -- tmux $@
}

#export PATH="/afs/csail.mit.edu/u/a/alexalex/.local/bin:$PATH"
#export GOPATH="/data/scratch/alexalex/.go"
#export GOCACHE="/data/scratch/alexalex/.cache/go"

export SCONSFLAGS="-j32 $SCONSFLAGS"
