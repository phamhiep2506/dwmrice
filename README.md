# Dotfiles

## Fix backlight

- Edit file `/etc/udev/rules.d/backlight.rules`
- Change `intel_backlight` to your graphics card

```bash
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video /sys/class/backlight/intel_backlight/brightness", RUN+="/bin/chmod g+w /sys/class/backlight/intel_backlight/brightness"
```
