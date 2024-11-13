#!/usr/bin/env sh

dunst &
/usr/local/bin/picom &
redshift -l 21.033333:105.849998 &
fcitx5 &
~/.fehbg &
/usr/local/bin/batteryd &
pkill -f /usr/local/bin/bar
/usr/local/bin/bar &
dwm
