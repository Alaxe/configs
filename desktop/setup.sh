#!/bin/bash

cd "$(dirname "$0")"
mkdir -f ~/.local/share/applications/
cp ./*.desktop ~/.local/share/applications
