#!/usr/bin/env sh

dunst &
picom &
redshift -l 21.033333:105.849998 &
fcitx5 &
~/.fehbg &
batteryd &
pkill -f /usr/local/bin/bar
bar &
dwm
