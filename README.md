# Dotfiles (Ubuntu 24.04.1 LTS)

## Install

```bash
git clone https://github.com/phamhiep2506/dotfiles $HOME/dotfiles
cd $HOME/dotfiles
./setup.sh
```

## Fix fcitx

- Add text to file `/etc/environment`

```
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
```

## Gnome extensions

- [just-perfection](https://extensions.gnome.org/extension/3843/just-perfection)
