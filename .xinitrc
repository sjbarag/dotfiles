#!/bin/bash
# Remap Caps Lock to Control
setxkbmap -option ctrl:nocaps

# disable autorepeat for multimedia keys
#       prev   play   next
xset -r 173 -r 172 -r 171

# map to mpd controls
xbindkeys -f ~/dotfiles/.xbindkeysrc

#fix window manager name so Java recognizes it
wmname LG3D

# start mpd
#mpd ~/.mpd/mpd.conf

# dwm bar
# kill old conkys first
pkill conky
conky | while read -r; do xsetroot -name "$REPLY"; done &
exec dwm
