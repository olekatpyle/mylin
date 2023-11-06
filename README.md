# ARCH LINUX INSTALLER - Hyprland (wayland)

This installer assumes you have completed the basic install explained in the
[ARCH Installation Guide](https://wiki.archlinux.org/title/Installation_guide).
Furthermore you should have transferred the installer + ssh-key for github on
the target machine.

The following packages need to be installed via pacstrap (pacstrap -K /mnt .. ):
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

After the base install is completed create user mox give it a password and edit the sudoers file to grant sudo priv.

```bash
useradd -m -G wheel mox
passwd mox
EDITOR=nano visudo
```

# Post Installation

GDM config - add cursor
```bash
sudo gdm dbus-launch gsettings set org.gnome.desktop.interface cursor-theme 'Qogir-cursors'
```

remove old zsh files in /home/mox and mv oh-my-zsh directory to new zsh dir
```
rm -rf ~/.zsh*
mv ~/.oh-my-zsh ~/.config/zsh/
ln -s /home/mox/.config/zsh/oni.zsh-theme /home/mox/.config/zsh/.oh-my-zsh/themes/oni.zsh-theme
```
