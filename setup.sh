#!/bin/bash

# install packages
install() {
  sudo pacman -S $1 --noconfirm
}

# remove file|folder
remove() {
  rm -rf $1
}

# link config
link() {
  ln -s $1 $2
}

# update
sudo pacman -Syu --noconfirm

# git
install git

# wget
install wget

# curl
install curl

# archive
install tar
install unzip

# create folder config
mkdir -p $HOME/.config

# xinit
install xorg
install xorg-xinit
install xorg-xsetroot
link $PWD/.xinitrc $HOME

# dwm
(cd $PWD/dwm && sudo make clean install)

# dmenu
install dmenu

# install scripts
sudo remove /usr/local/bin/volume
sudo remove /usr/local/bin/batteryd
sudo remove /usr/local/bin/brightness
sudo remove /usr/local/bin/screenshot
sudo remove /usr/local/bin/netspeed
sudo remove /usr/local/bin/cpu
sudo remove /usr/local/bin/ram
sudo remove /usr/local/bin/battery
sudo remove /usr/local/bin/bar

sudo link $PWD/scripts/volume /usr/local/bin
sudo link $PWD/scripts/batteryd /usr/local/bin
sudo link $PWD/scripts/brightness /usr/local/bin
sudo link $PWD/scripts/screenshot /usr/local/bin
sudo link $PWD/scripts/netspeed /usr/local/bin
sudo link $PWD/scripts/cpu /usr/local/bin
sudo link $PWD/scripts/ram /usr/local/bin
sudo link $PWD/scripts/battery /usr/local/bin
sudo link $PWD/scripts/bar /usr/local/bin

# wallpaper
install feh

# lockscreen
install slock
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
install ly
sudo systemctl enable ly.service

# fcitx5
install fcitx5
install fcitx5-im
install fcitx5-unikey

# fix env
sudo tee /etc/environment << EOF
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
EOF

# touchpad
sudo tee /etc/X11/xorg.conf.d/30-touchpad.conf << EOF
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "TappingButtonMap" "lmr"
    Option "NaturalScrolling" "true"
EndSection
EOF

# font
install ttf-dejavu
install ttf-jetbrains-mono
install ttf-jetbrains-mono-nerd
install noto-fonts-cjk
install noto-fonts-emoji

# terminal
install alacritty
remove $HOME/.config/alacritty
link $PWD/alacritty $HOME/.config

# tmux
install tmux
remove $HOME/.config/tmux
link $PWD/tmux $HOME/.config

# nvim
install nvim
install ripgrep
remove $HOME/.config/nvim
link $PWD/nvim $HOME/.config

# dunst
install dunst
install libnotify
remove $HOME/.config/dunst
link $PWD/dunst $HOME/.config

# ranger
install ranger
install python-pillow
install ueberzug
remove $HOME/.config/ranger
link $PWD/ranger $HOME/.config
remove $HOME/.config/ranger/plugins/ranger_devicons
git clone https://github.com/alexanderjeurissen/ranger_devicons $HOME/.config/ranger/plugins/ranger_devicons --depth 1

# redshift
install redshift

# clipboard
install xclip

# picom
install libgl libev pcre2 libx11 xcb-util-renderutil libxcb libepoxy xcb-util-image libxext pixman libconfig libdbus hicolor-icon-theme
install git mesa meson asciidoc uthash xorgproto
git clone https://github.com/FT-Labs/picom $PWD/picom-git --depth 1
(cd picom-git && meson setup --buildtype=release build && ninja -C build install)
remove $PWD/picom-git
remove $HOME/.config/picom
link $PWD/picom $HOME/.config

# gtk/icon
install materia-gtk-theme
install papirus-icon-theme
tee $HOME/.gtkrc-2.0 << EOF
gtk-theme-name="Materia-dark"
gtk-icon-theme-name="Papirus-Dark"
EOF
mkdir -p $HOME/.config/gtk-3.0
tee $HOME/.config/gtk-3.0/settings.ini << EOF
[Settings]
gtk-theme-name=Materia-dark
gtk-icon-theme-name=Papirus-Dark
EOF

# cursor
wget https://github.com/ful1e5/Bibata_Cursor/releases/latest/download/Bibata-Modern-Classic.tar.xz
sudo tar xvf Bibata-Modern-Classic.tar.xz -C /usr/share/icons
sudo tee /usr/share/icons/default/index.theme << EOF
[Icon Theme]
Inherits=Bibata-Modern-Classic
EOF
remove $PWD/Bibata-Modern-Classic.tar.xz

# volume
install pavucontrol
install pamixer

# backlight
install brightnessctl

# mpv
install mpv

# viewnior
install viewnior

# screenshot
install flameshot

# zsh
install starship
install zsh
install lsd
mkdir -p $HOME/.zsh/plugins
remove $HOME/.zsh/plugins/zsh-autosuggestions
remove $HOME/.zsh/plugins/zsh-syntax-highlighting
remove $HOME/.zsh/plugins/zsh-vi-mode
remove $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/plugins/zsh-autosuggestions --depth 1
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.zsh/plugins/zsh-syntax-highlighting --depth 1
git clone https://github.com/jeffreytse/zsh-vi-mode $HOME/.zsh/plugins/zsh-vi-mode --depth 1
link $PWD/zsh/.zshrc $HOME
link $PWD/zsh/starship.toml $HOME/.config

# reboot
while true; do
  read -p "Reboot now? (Y/n) " yn
  case $yn in
    y|Y )
      sudo systemctl reboot
      ;;
    n|N )
      exit
      ;;
    * )
      ;;
  esac
done
