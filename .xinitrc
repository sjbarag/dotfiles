# Remap Caps Lock to Control
setxkbmap -option ctrl:nocaps

#fix window manager name so Java recognizes it
wmname LG3D

# dropbox daemon
#dropboxd &

# start mpd
mpd ~/.mpd/mpd.conf

# dwm bar
sudo conky -c /home/sean/.conkyrc | while read -r; do xsetroot -name "$REPLY"; done &
#exec twm
exec dwm
