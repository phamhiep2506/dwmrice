#!/bin/bash

# install packages
install_pkg() {
  sudo pacman -S $1 --noconfirm
}

# remove file|folder
remove_file() {
  rm -rf $1
}

# link config
link_config() {
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

# archive
install_pkg tar
install_pkg unzip

# create folder config
mkdir -p $HOME/.config

# xinit
install_pkg xorg
install_pkg xorg-xinit
install_pkg xorg-xsetroot
link_config $PWD/.xinitrc $HOME

# dwm
(cd $PWD/dwm && sudo make clean install)

# dmenu
install_pkg dmenu

# install scripts
sudo rm -rf /usr/local/bin/volume
sudo rm -rf /usr/local/bin/batteryd
sudo rm -rf /usr/local/bin/brightness
sudo rm -rf /usr/local/bin/screenshot
sudo rm -rf /usr/local/bin/netspeed
sudo rm -rf /usr/local/bin/cpu
sudo rm -rf /usr/local/bin/ram
sudo rm -rf /usr/local/bin/battery
sudo rm -rf /usr/local/bin/bar

sudo ln -s $PWD/scripts/volume /usr/local/bin
sudo ln -s $PWD/scripts/batteryd /usr/local/bin
sudo ln -s $PWD/scripts/brightness /usr/local/bin
sudo ln -s $PWD/scripts/screenshot /usr/local/bin
sudo ln -s $PWD/scripts/netspeed /usr/local/bin
sudo ln -s $PWD/scripts/cpu /usr/local/bin
sudo ln -s $PWD/scripts/ram /usr/local/bin
sudo ln -s $PWD/scripts/battery /usr/local/bin
sudo ln -s $PWD/scripts/bar /usr/local/bin

# wallpaper
install_pkg feh

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
install_pkg ttf-dejavu
install_pkg ttf-jetbrains-mono
install_pkg ttf-jetbrains-mono-nerd
install_pkg noto-fonts-cjk
install_pkg noto-fonts-emoji

# terminal
install_pkg alacritty
remove_file $HOME/.config/alacritty
link_config $PWD/alacritty $HOME/.config

# tmux
install_pkg tmux
remove_file $HOME/.config/tmux
link_config $PWD/tmux $HOME/.config

# nvim
install_pkg nvim
install_pkg ripgrep
remove_file $HOME/.config/nvim
link_config $PWD/nvim $HOME/.config

# dunst
install_pkg dunst
install_pkg libnotify
remove_file $HOME/.config/dunst
link_config $PWD/dunst $HOME/.config

# ranger
install_pkg ranger
install_pkg python-pillow
install_pkg ueberzug
remove_file $HOME/.config/ranger
link_config $PWD/ranger $HOME/.config
remove_file $HOME/.config/ranger/plugins/ranger_devicons
git clone https://github.com/alexanderjeurissen/ranger_devicons $HOME/.config/ranger/plugins/ranger_devicons --depth 1

# redshift
install_pkg redshift

# clipboard
install_pkg xclip

# picom
install_pkg picom

# gtk/icon
install_pkg materia-gtk-theme
install_pkg papirus-icon-theme
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
remove_file $PWD/Bibata-Modern-Classic.tar.xz

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
install_pkg flameshot

# zsh
install_pkg zsh
install_pkg lsd
install_pkg starship
mkdir -p $HOME/.zsh/plugins
remove_file $HOME/.zsh/plugins/zsh-autosuggestions
remove_file $HOME/.zsh/plugins/zsh-syntax-highlighting
remove_file $HOME/.zsh/plugins/zsh-vi-mode
remove_file $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/plugins/zsh-autosuggestions --depth 1
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.zsh/plugins/zsh-syntax-highlighting --depth 1
git clone https://github.com/jeffreytse/zsh-vi-mode $HOME/.zsh/plugins/zsh-vi-mode --depth 1
link_config $PWD/zsh/.zshrc $HOME
remove_file $HOME/.config/starship.toml
link_config $PWD/zsh/starship.toml $HOME/.config

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
