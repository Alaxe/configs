#!/usr/bin/zsh

export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM="wayland"
export ELECTRON_OZONE_PLATFORM_HINT="wayland"

export BEMENU_OPTS='-i -p "" --fn "Inconsolata Nerd Font Propo 14" -H 30 --hp 5 \
    --fb "#222D31" --nb "#222D31" --ab "#222D31" \
    --hb "#556064" --tb "#556064" \
    --hf "#80FFF9" --tf "#80FFF9"'

if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec sway
fi
