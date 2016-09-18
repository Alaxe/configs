#!/bin/sh
cd "$(dirname $0)"
rm ~/.i3 -rf

cp default/files ~/.i3 -R

