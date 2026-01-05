#!/bin/bash
AFS_HOME=/afs/csail/u/a/alexalex/
NFS_HOME=/data/sanchez/users/alexalex
ln -sf $AFS_HOME/.ssh $NFS_HOME

stow -t $AFS_HOME -R corellia-afs ssh
stow -t $NFS_HOME -R cli corellia
