#!/usr/bin/env bash

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

# jq
install_pkg jq

# archive
install_pkg tar

# create folder config
mkdir -p $HOME/.config

# fcitx5
install_pkg fcitx5
install_pkg fcitx5-unikey
if ! $(grep -Fxq "$(echo 'GTK_IM_MODULE=fcitx\nQT_IM_MODULE=fcitx\nXMODIFIERS=@im=fcitx')" /etc/environment); then
sudo tee -a /etc/environment << EOF
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
EOF
fi
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
install_pkg kitty
remove_file $HOME/.config/kitty
link_config $PWD/kitty $HOME/.config

# tmux
install_pkg tmux
mkdir -p $HOME/.tmux/plugins
remove_file $HOME/.tmux/plugins/tmux-resurrect
remove_file $HOME/.tmux/plugins/tmux-yank
git clone https://github.com/tmux-plugins/tmux-resurrect $HOME/.tmux/plugins/tmux-resurrect --depth 1
git clone https://github.com/tmux-plugins/tmux-yank $HOME/.tmux/plugins/tmux-yank --depth 1
remove_file $HOME/.config/tmux
link_config $PWD/tmux $HOME/.config

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
for i in {1..9}; do
  gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
done
for i in {1..9}; do
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
done
for i in {1..9}; do
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Shift><Super>$i']"
done

# gnome extensions
GNOME_SHELL_VERSION=$(gnome-shell --version | awk '{print $3}' | awk -F "." '{print $1}')
EXTENSIONS=(
just-perfection-desktop@just-perfection
blur-my-shell@aunetx
)
for EXTENSION in "${EXTENSIONS[@]}"; do
  VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=$EXTENSION" | jq '.extensions[0]' | jq '.shell_version_map | ."'"$GNOME_SHELL_VERSION"'" | ."pk"')
  wget https://extensions.gnome.org/download-extension/$EXTENSION.shell-extension.zip?version_tag=$VERSION_TAG -O $PWD/$EXTENSION.zip
  gnome-extensions install --force $PWD/$EXTENSION.zip
  rm -rf $PWD/$EXTENSION.zip
done

# setup extensions
mkdir -p $HOME/.local/bin
tee $HOME/.local/bin/setup-extensions << EOF
#!/usr/bin/env bash
gnome-extensions enable just-perfection-desktop@just-perfection
dconf write /org/gnome/shell/extensions/just-perfection/dash false
dconf write /org/gnome/shell/extensions/just-perfection/workspace-popup false
dconf write /org/gnome/shell/extensions/just-perfection/workspaces-in-app-grid false
gnome-extensions enable blur-my-shell@aunetx
EOF
chmod +x $HOME/.local/bin/setup-extensions
tee $HOME/.config/autostart/setup-extensions.desktop << EOF
[Desktop Entry]
Type=Application
Name=setup-extensions
Exec=$HOME/.local/bin/setup-extensions
EOF

# zsh
install_pkg zsh
install_pkg lsd
mkdir -p $HOME/.zsh/plugins
remove_file $HOME/.zsh/plugins/zsh-autosuggestions
remove_file $HOME/.zsh/plugins/zsh-syntax-highlighting
remove_file $HOME/.zsh/plugins/zsh-vi-mode
remove_file $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/plugins/zsh-autosuggestions --depth 1
git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/.zsh/plugins/zsh-syntax-highlighting --depth 1
git clone https://github.com/jeffreytse/zsh-vi-mode $HOME/.zsh/plugins/zsh-vi-mode --depth 1
link_config $PWD/zsh/.zshrc $HOME
chsh -s $(which zsh)

# reboot
while true; do
  read -p "Reboot now? (y/n) " yn
  case $yn in
    y|Y )
      sudo systemctl reboot
      exit
      ;;
    n|N )
      exit 0
      ;;
    * )
      ;;
  esac
done
