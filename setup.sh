#!/bin/bash

# install packages
install_pkg() {
  sudo apt install -y $1
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
sudo apt update

# git
install_pkg git

# wget
install_pkg wget

# curl
install_pkg curl

# archive
install_pkg tar

# create folder config
mkdir -p $HOME/.config

# fcitx5
install_pkg fcitx5
install_pkg fcitx5-unikey
mkdir -p $HOME/.config/autostart
tee $HOME/.config/autostart/fcitx5.desktop << EOF
[Desktop Entry]
Type=Application
Name=fcitx5
Exec=/usr/bin/fcitx5
EOF

# font
install_pkg fonts-jetbrains-mono
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz -O $PWD/JetBrainsMono.tar.xz
sudo mkdir -p /usr/local/share/fonts/JetBrainsMonoNF
sudo tar -xvf $PWD/JetBrainsMono.tar.xz -C /usr/local/share/fonts/JetBrainsMonoNF
remove_file $PWD/JetBrainsMono.tar.xz
fc-cache

# cursor
wget https://github.com/ful1e5/Bibata_Cursor/releases/latest/download/Bibata-Modern-Classic.tar.xz -O $PWD/Bibata-Modern-Classic.tar.xz
sudo tar -xvf $PWD/Bibata-Modern-Classic.tar.xz -C /usr/share/icons
remove_file $PWD/Bibata-Modern-Classic.tar.xz
gsettings set org.gnome.desktop.interface cursor-theme "Bibata-Modern-Classic"
gsettings set org.gnome.desktop.interface cursor-size 20

# terminal
install_pkg alacritty
remove_file $HOME/.config/alacritty
link_config $PWD/alacritty $HOME/.config

# tmux
install_pkg tmux
remove_file $HOME/.tmux.conf
link_config $PWD/tmux/.tmux.conf $HOME

# nvim
install_pkg neovim
install_pkg ripgrep
remove_file $HOME/.config/nvim
link_config $PWD/nvim $HOME/.config

# ranger
install_pkg ranger
remove_file $HOME/.config/ranger
link_config $PWD/ranger $HOME/.config
remove_file $HOME/.config/ranger/plugins/ranger_devicons
git clone https://github.com/alexanderjeurissen/ranger_devicons $HOME/.config/ranger/plugins/ranger_devicons --depth 1

# clipboard
install_pkg xclip

# mpv
install_pkg mpv

# viewnior
install_pkg viewnior

# gnome
gnome-extensions disable ubuntu-dock@ubuntu.com
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 9
for i in {1..9}
do
  gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
done
for i in {1..9}
do
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
done
for i in {1..9}
do
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Shift><Super>$i']"
done

# zsh
install_pkg zsh
install_pkg lsd
curl -sS https://starship.rs/install.sh | sh
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
chsh -s $(which zsh)

# reboot
while true; do
  read -p "Reboot now? (y/n) " yn
  case $yn in
    y|Y )
      sudo systemctl reboot
      ;;
    n|N )
      exit 0
      ;;
    * )
      ;;
  esac
done
