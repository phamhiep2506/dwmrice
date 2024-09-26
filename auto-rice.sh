#!/bin/sh

# install packages
install_pkg() {
  sudo pacman --noconfirm --needed -S $1
}

# git
install_pkg git

# remove config
rm_config() {
  if [[ -e $1 || -f $1 ]]; then
    rm -rfv $1
  fi
}

# copy config
cp_config() {
  cp -av $1 $2
}

# create folder config
mkdir -p $HOME/.config

# xorg
install_pkg xorg

# font
install_pkg ttf-dejavu
install_pkg ttf-jetbrains-mono
install_pkg ttf-jetbrains-mono-nerd
install_pkg noto-fonts-cjk
install_pkg noto-fonts-emoji

# bspwm
install_pkg bspwm
rm_config $HOME/.config/bspwm
cp_config $PWD/bspwm $HOME/.config

# sxhkd
install_pkg sxhkd
rm_config $HOME/.config/sxhkd
cp_config $PWD/sxhkd $HOME/.config

# terminal
install_pkg alacritty
rm_config $HOME/.config/alacritty
cp_config $PWD/alacritty $HOME/.config

# picom
install_pkg picom
rm_config $HOME/.config/picom
cp_config $PWD/picom $HOME/.config

# polybar
install_pkg polybar
rm_config $HOME/.config/polybar
cp_config $PWD/polybar $HOME/.config

# rofi
install_pkg rofi
rm_config $HOME/.config/rofi
cp_config $PWD/rofi $HOME/.config

# dunst
install_pkg dunst
rm_config $HOME/.config/dunst
cp_config $PWD/dunst $HOME/.config

# tmux
install_pkg tmux
rm_config $HOME/.config/tmux
cp_config $PWD/tmux $HOME/.config

# scripts
# volume
sudo rm -rfv /usr/local/bin/volume
sudo cp -av $PWD/scripts/volume /usr/local/bin
# brightness
sudo rm -rfv /usr/local/bin/brightness
sudo cp -av $PWD/scripts/brightness /usr/local/bin
# battery
sudo rm -rfv /usr/local/bin/battery
sudo cp -av $PWD/scripts/battery /usr/local/bin

# nitrogen
install_pkg nitrogen

# fcitx5
install_pkg fcitx5
install_pkg fcitx5-im
install_pkg fcitx5-unikey
sudo tee /etc/environment << EOF
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
EOF

# redshift
install_pkg redshift

# xclip
install_pkg xclip

# flameshot
install_pkg flameshot

# nm-applet
install_pkg network-manager-applet

# gtk/icon
install_pkg lxappearance
install_pkg materia-gtk-theme
install_pkg papirus-icon-theme

# cursor
install_pkg wget
wget https://github.com/ful1e5/Bibata_Cursor/releases/latest/download/Bibata-Modern-Classic.tar.xz
sudo tar xvf Bibata-Modern-Classic.tar.xz -C /usr/share/icons
sudo tee /usr/share/icons/default/index.theme << EOF
[Icon Theme]
Inherits=Bibata-Modern-Classic
EOF
rm -rf Bibata-Modern-Classic.tar.xz

# thunar
install_pkg thunar
install_pkg gvfs
install_pkg thunar-archive-plugin
install_pkg thunar-volman

# ranger
install_pkg ranger

# volume
install_pkg pamixer
install_pkg pavucontrol

# mpv
install_pkg mpv

# viewnior
install_pkg viewnior

# chromium
install_pkg chromium

# add user to a group
sudo usermod -a -G video $USER

# ly
install_pkg ly
sudo systemctl enable ly.service

# slock
install_pkg slock
sudo tee /etc/systemd/system/slock@.service << EOF
[Unit]
Description=Lock X session using slock for user %i
Before=sleep.target

[Service]
User=%i
Environment=DISPLAY=:0
ExecStartPre=/usr/bin/xset dpms force suspend
ExecStart=/usr/bin/slock

[Install]
WantedBy=sleep.target
EOF
sudo systemctl enable slock@$USER.service

# neovim
install_pkg neovim
install_pkg ripgrep
mkdir -p $HOME/.config/nvim
rm_config $HOME/.config/nvim/init.vim
cp_config $PWD/nvim/init.vim $HOME/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# xbanish
read -p "Do you want to install xbanish? (y/n) " yn
case $yn in
  y)
    sudo rm -rfv /opt/xbanish
    sudo git clone --depth=1 https://github.com/jcs/xbanish /opt/xbanish
    (cd /opt/xbanish; sudo make clean install)
    ;;
  n)
    ;;
esac

# zsh
install_pkg zsh
mkdir -p $HOME/.zsh/plugins
rm -rf $HOME/.zsh/plugins/*
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/jeffreytse/zsh-vi-mode $HOME/.zsh/plugins/zsh-vi-mode
cp_config $PWD/zsh/zshrc $HOME/.zshrc

# reboot
read -p "Reboot now? (y/n) " yn
case $yn in
  y)
    sudo systemctl reboot
    ;;
  n)
    ;;
esac
