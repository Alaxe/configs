#!/bin/bash

# Add to /etc/pam.d/lightdm-autologin:
# auth        optional    pam_gnome_keyring.so
# session     optional    pam_gnome_keyring.so auto_start
# See https://wiki.archlinux.org/index.php/GNOME/Keyring#With_a_display_manager

if [ -n "$DESKTOP_SESSION" ];then
    eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
fi
