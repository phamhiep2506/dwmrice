# Dotfiles (Hyprland)

## Auto rice

```bash
git clone https://gitlab.com/phiepdev/dotfiles
cd dotfiles
git checkout <branch>
./auto-rice.sh
```

## Brave browser

- Install [brave-bin](https://aur.archlinux.org/packages/brave-bin)

```bash
git clone https://aur.archlinux.org/brave-bin.git
cd brave-bin
makepkg -si
```

- Disabling Kwallet for brave, edit file `/usr/share/applications/brave-browser.desktop`

```desktop
Exec=brave %U --password-store=basic
```
