# ARCH LINUX INSTALLER - Hyprland (wayland)

This installer assumes you have completed the basic install explained in the
[ARCH Installation Guide](https://wiki.archlinux.org/title/Installation_guide).
Furthermore you should have transferred the installer + ssh-key for github on
the target machine.

The following packages need to be installed via pacstrap:
- base
- base-devel
- meson
- linux
- linux-firmware
- linux-headers
- nano
- git
- networkmanager
- openssh
- man-db
- man-pages

After the base install is completed create user mox give it a password and edit the sudoers file.

```bash
useradd -m -G wheel mox
passwd mox
EDITOR=nano visudo
```
