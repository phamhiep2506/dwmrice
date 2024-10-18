#!/bin/bash

# install packages
install_pkg() {
  sudo pacman -S $1 --noconfirm
}

# remove config
rm_config() {
  rm -rf $1
}

# link config
ln_config() {
  ln -s $1 $2
}

# update
sudo pacman -Syu --noconfirm

# git
install_pkg git

# wget
install_pkg wget

# curl
install_pkg curl

# add user to a group
# sudo usermod -a -G video $USER

# create folder config
mkdir -p $HOME/.config

# xinit
install_pkg xorg
install_pkg xorg-xinit
install_pkg xorg-xsetroot
ln_config $PWD/.xinitrc $HOME

# dwm
(cd $PWD/dwm && sudo make clean install)
install_pkg dmenu

# slstatus
(cd $PWD/slstatus && sudo make clean install)

# install scripts
sudo rm -rf /usr/local/bin/volume
sudo rm -rf /usr/local/bin/batteryd
sudo rm -rf /usr/local/bin/brightness
sudo rm -rf /usr/local/bin/screenshot
sudo rm -rf /usr/local/bin/netspeed

sudo ln -s $PWD/scripts/volume /usr/local/bin
sudo ln -s $PWD/scripts/batteryd /usr/local/bin
sudo ln -s $PWD/scripts/brightness /usr/local/bin
sudo ln -s $PWD/scripts/screenshot /usr/local/bin
sudo ln -s $PWD/scripts/netspeed /usr/local/bin

# wallpaper
install_pkg feh
feh --bg-fill $HOME/dotfiles/wallpaper/anime_girl_black.png

# lockscreen
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

# ly
install_pkg ly
sudo systemctl enable ly.service

# fcitx5
install_pkg fcitx5
install_pkg fcitx5-im
install_pkg fcitx5-unikey

# fix env
sudo tee /etc/environment << EOF
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
EOF

# font
install_pkg ttf-dejavu
install_pkg ttf-jetbrains-mono
install_pkg ttf-jetbrains-mono-nerd
install_pkg noto-fonts-cjk
install_pkg noto-fonts-emoji

# terminal
install_pkg kitty
rm_config $HOME/.config/kitty
ln_config $PWD/kitty $HOME/.config

# tmux
install_pkg tmux
rm_config $HOME/.config/tmux
ln_config $PWD/tmux $HOME/.config

# neovim
install_pkg neovim
install_pkg ripgrep
rm_config $HOME/.config/nvim
ln_config $PWD/nvim $HOME/.config

# dunst
install_pkg dunst
rm_config $HOME/.config/dunst
ln_config $PWD/dunst $HOME/.config

# ranger
install_pkg ranger
install_pkg python-pillow
rm_config $HOME/.config/ranger
ln_config $PWD/ranger $HOME/.config
rm_config $HOME/.config/ranger/plugins/ranger_devicons
git clone https://github.com/alexanderjeurissen/ranger_devicons $HOME/.config/ranger/plugins/ranger_devicons --depth 1

# wlsunset
install_pkg redshift

# nm-applet
install_pkg network-manager-applet

# clipboard
install_pkg xclip

# picom
install_pkg picom

# gtk/icon
install_pkg materia-gtk-theme
install_pkg papirus-icon-theme
install_pkg lxappearance-gtk3

# cursor
wget https://github.com/ful1e5/Bibata_Cursor/releases/latest/download/Bibata-Modern-Classic.tar.xz
sudo tar xvf Bibata-Modern-Classic.tar.xz -C /usr/share/icons
sudo tee /usr/share/icons/default/index.theme << EOF
[Icon Theme]
Inherits=Bibata-Modern-Classic
EOF
rm -rf Bibata-Modern-Classic.tar.xz

# volume
install_pkg pavucontrol
install_pkg pamixer

# backlight
install_pkg brightnessctl

# mpv
install_pkg mpv

# viewnior
install_pkg viewnior

# screenshot
install_pkg scrot

# utils
install_pkg httpie
install_pkg fx
install_pkg jq

# zsh
install_pkg zsh
install_pkg lsd
mkdir -p $HOME/.zsh/plugins
rm_config $HOME/.zsh/plugins/zsh-autosuggestions
rm_config $HOME/.zsh/plugins/zsh-syntax-highlighting
rm_config $HOME/.zsh/plugins/zsh-vi-mode
rm_config $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/plugins/zsh-autosuggestions --depth 1
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.zsh/plugins/zsh-syntax-highlighting --depth 1
git clone https://github.com/jeffreytse/zsh-vi-mode $HOME/.zsh/plugins/zsh-vi-mode --depth 1
ln_config $PWD/zsh/.zshrc $HOME
chsh -s /bin/zsh

# reboot
read -p "Reboot now? (y/n) " yn
case $yn in
  y)
    sudo systemctl reboot
    ;;
  n)
    ;;
esac
