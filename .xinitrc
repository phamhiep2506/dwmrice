#!/usr/bin/env sh

dunst &
picom &
redshift -l 21.033333:105.849998 &
fcitx5 &
~/.fehbg &
batteryd &

process=$(ps -aux | grep bar | head -n 1 | awk '{print $2}')
kill -9 $process
bar &

dwm
