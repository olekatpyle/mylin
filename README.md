# ARCH LINUX INSTALLER - Hyprland (wayland)

This installer assumes you have completed the basic install explained in the
[ARCH Installation Guide](https://wiki.archlinux.org/title/Installation_guide)

The following packages need to be installed via pacstrap:
- base
- linux
- linux-firmware
- git
- networkmanager
- openssh
- man-db
- man-pages

Afterwards create user mox
# User
echo "Creating user 'mox'"
useradd -m -G wheel networkmanager mox

echo "Set password for user mox.."
passwd mox

Finally add the sshkey and clone the repository into /home/mox/.local/repo.

mkdir -p .local/repo
cd .local/repo
eval $(ssh-agent)
ssh-add /home/mox/.ssh/github
git clone git@github.com:olekatpyle/mylin.git

You are ready to launch the installer inside the repository.
