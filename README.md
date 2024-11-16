# Dotfiles (Ubuntu)

## Install

```bash
git clone https://gitlab.com/phiepdev/dotfiles $HOME/dotfiles
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

- just-perfection
