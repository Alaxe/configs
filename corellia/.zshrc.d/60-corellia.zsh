#!/bin/zsh
#export ZSIMDEPSROOT=/data/sanchez/benchmarks/zsim-deps
#export PINPATH=$ZSIMDEPSROOT/pin-2.14-71313-gcc.4.4.7-linux
#export LIBCONFIGPATH=/data/sanchez/benchmarks/alexalex/isa/libconfig-1.7.3/inst/
#export POLARSSLPATH=$ZSIMDEPSROOT/polarssl-1.1.4/
#export DRAMSIMPATH=$ZSIMDEPSROOT/DRAMSim2/
#export ZSIMAPPSPATH=/data/sanchez/benchmarks/zsim-apps/
#export PIN_HOME=$ZSIMDEPSROOT/pin-2.14-71313-gcc.4.4.7-linux

source /afs/csail.mit.edu/system/common/etc/zsh/zprofile.csail

#export PATH="/data/sanchez/tools/gcc-8.2/bin:/data/sanchez/tools/gcc-8.2/bin:/usr/local/csail/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/afs/athena.mit.edu/course/6/6.004/yosys/bin:/snap/bin:/data/sanchez/tools/qmn/18.04/bsc-vagrant/bin:/data/sanchez/tools/nsamar/18.04/minispec/synth:/afs/athena.mit.edu/course/6/6.004/yosys/bin:/data/sanchez/tools/nsamar/18.04/minispec:/data/sanchez/tools/qmn/18.04/bsc-vagrant/bin:/data/sanchez/tools/nsamar/18.04:/data/sanchez/tools/qmn/18.04/bsc-vagrant/bin:/data/sanchez/tools/nsamar/18.04/minispec/synth:/afs/athena.mit.edu/course/6/6.004/yosys/bin:/data/sanchez/tools/nsamar/18.04/minispec:$PATH"
#source /data/sanchez/tools/gcc-8.2/paths.sh
#source /data/sanchez/tools/qmn/22.04/minispec/paths-vagrant.sh
source /data/sanchez/tools/yifany/minispec/paths.sh

export PATH="/afs/csail.mit.edu/u/a/alexalex/.local/bin:$PATH"
export GOPATH="/data/scratch/alexalex/.go"
export GOCACHE="/data/scratch/alexalex/.cache/go"

export SCONSFLAGS="-j32 $SCONSFLAGS"
export TERM="xterm-256color"

source /data/sanchez/tools/alexalex/dev/env.sh
