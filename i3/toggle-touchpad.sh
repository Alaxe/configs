#!/bin/bash
# Based on https://bbs.archlinux.org/viewtopic.php?id=232078

DEV="FocalTechPS/2 FocalTech Touchpad"

if xinput list-props "$DEV" | grep "Device Enabled (153):.*1" >/dev/null
then
  xinput disable "$DEV"
  notify-send -t 1000 -i mouse "Touchpad disabled"
else
  xinput enable "$DEV"
  notify-send -t 1000 -i mouse "Touchpad enabled"
fi
