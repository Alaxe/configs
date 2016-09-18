#!/bin/bash
cd "$(dirname "$0")"

help="\
Usage: setup.sh [platform]

Platform may be any of: laptop, desktop
";

if [ "$#" -gt "1" ]; then
    printf "$help";
    exit;
fi

printf "Installing default configs\n";
sudo sh global/default/root.sh;
sh global/default/user.sh;

if [ "$1" == "laptop" ]; then
    printf "Installing laptop-specific configs\n";
    sudo sh global/laptop/root.sh;
    sh global/laptop/user.sh;
elif [ "$i" == "desktop" ]; then
    printf "Installing desktop-specific configs\n";
elif [ "$#" -eq "1" ]; then
    printf "Invalid platorm\n";
    printf "$help";
fi


