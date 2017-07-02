#!/bin/bash

cd $(dirname $0)

mkdir -p ~/.config
cp chromium-flags.conf ~/.config/chromium-flags.conf
