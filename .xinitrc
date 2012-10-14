#!/bin/bash
# Remap Caps Lock to Control
setxkbmap -option ctrl:nocaps

#fix window manager name so Java recognizes it
wmname LG3D

# dwm bar
# kill old conkys first
pkill conky
conky | while read -r; do xsetroot -name "$REPLY"; done &
exec dwm
