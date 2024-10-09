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

# add user to a group
sudo usermod -a -G video $USER

# create folder config
mkdir -p $HOME/.config

# hyprland
install_pkg hyprland
install_pkg hyprpaper
install_pkg hyprlock
install_pkg hypridle
install_pkg xdg-desktop-portal-hyprland
rm_config $HOME/.config/hypr
ln_config $PWD/hypr $HOME/.config

# fix env
sudo tee /etc/environment << EOF
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx

XDG_CURRENT_DESKTOP=Hyprland
XDG_SESSION_TYPE=wayland
XDG_SESSION_DESKTOP=Hyprland
EOF

# font
install_pkg ttf-dejavu
install_pkg ttf-jetbrains-mono
install_pkg ttf-jetbrains-mono-nerd
install_pkg noto-fonts-cjk
install_pkg noto-fonts-emoji

# wget
install_pkg wget

# curl
install_pkg curl

# wofi
install_pkg wofi
rm_config $HOME/.config/wofi
ln_config $PWD/wofi $HOME/.config

# terminal
install_pkg kitty
rm_config $HOME/.config/kitty
ln_config $PWD/kitty $HOME/.config

# tmux
install_pkg tmux
rm_config $HOME/.config/tmux
ln_config $PWD/tmux $HOME/.config

# waybar
install_pkg waybar
rm_config $HOME/.config/waybar
ln_config $PWD/waybar $HOME/.config

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

# wlsunset
install_pkg wlsunset

# nm-applet
install_pkg network-manager-applet

# xclip
install_pkg wl-clipboard

# fcitx5
install_pkg fcitx5
install_pkg fcitx5-im
install_pkg fcitx5-unikey

# gtk/icon
install_pkg materia-gtk-theme
install_pkg papirus-icon-theme
gsettings set org.gnome.desktop.interface gtk-theme Materia-dark
gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark

# cursor
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
install_pkg slurp
install_pkg grim

# zsh
install_pkg zsh
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
