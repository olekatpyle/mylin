#!/usr/bin/env sh

# INSTALLER DEPS
echo "Installing software needed for the install process.."
sudo pacman -S \
    linux-headers \
    base-devel \
    meson \


#-----------------------------------------------------------------------------+
# GLOBAL SETTINGS                                                             |
#-----------------------------------------------------------------------------+

# DIRS
cd /home/mox
echo "Setting up directory structures.."
mkdir -p .local/bin
mkdir .config

mkdir .local/repo
cd .local/repo
eval $(ssh-agent)
ssh-add /home/mox/.ssh/github
git clone git@github.com:olekatpyle/mylin.git
cd /home/mox
#-----------------------------------------------------------------------------+
# SOFTWARE INSTALLATION                                                       |
#-----------------------------------------------------------------------------+

# YAY
echo "Installing yay.."
cd .local/repo
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd /home/mox

# HYPRLAND
echo "Installing hyprland.."
yay -S hyprland-git

# RUST
echo "Rust installation.. follow rustup instructions.."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# DISPLAY MANAGER
echo "Setting up GDM.."
sudo pacman -S gdm
sudo systemctl enable gdm.service
sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules

# ZSH + OHMYZSH
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv /home/mox/.oh-my-zsh /home/mox/.config/zsh/
rm ./.zsh*

# EWW (+ deps)
echo "Installing dependencies for eww.."
sudo pacman -S \
    gtk3 \
    gtk-layer-shell \
    pango \
    gdk-pixbuf2 \
    cairo \
    glib2 \
    gcc-libs \
    glibc

cd .local/repo
git clone https://github.com/elkowar/eww
cd eww
cargo build --release --no-default-features --features=wayland
cp target/release/eww /home/mox/.local/bin
chmod +x /home/mox/.local/bin/eww
cd /home/mox

# SOFTWARE
echo "Importing gpg keys.."
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | gpg --import -
echo "Installing additional system software.."
sudo pacman -S \
    neovim \
    nano \
    kitty \
    htop \
    tmux \
    bluez \
    bluez-utils \
    blueman \
    sof-firmware \
    alsa-ucm-conf \
    polkit \
    polkit-gnome \
    pciutils \
    xdg-desktop-portal-hyprland \
    xdg-utils \
    udiskie \
    network-manager-applet \
    wl-clipboard \
    hyprpaper \
    ripgrep
    wofi \
    bc \
    socat \
    fd \
    libnotify \
    mako \
    vivid \
    pavucontrol \
    pipewire \
    pipewire-pulse \
    pipewire-alsa \
    wireplumber \
    ttf-firacode-nerd \
    noto-fonts-cjk \

    # General Purpose
    firefox \
    playerctl \
    betterbird
    #qemu-base
    #discord
    #telegram-desktop
    #etcher
    #gparted

yay -S \
    swaylock-effects \
    spotify \
    jaq \
    gojq \
    nwg-look \
    gtk-theme-material-black \
    qogir-cursor-theme-git

# GIT
git config --global user.email "olekatpyle@gmail.com"
git config --global user.name "olekatpyle"
git config --global init.defaultBranch main

# TMUX
cd /home/mox
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# GDM config
sudo gdm dbus-launch gsettings set org.gnome.desktop.interface cursor-theme 'Qogir-cursors'

# Link/distribute system configs
rm -rf .config/eww
rm -rf .config/hypr
rm -rf .config/kitty
rm -rf .config/mako
rm -rf .config/wlogout
rm -rf .config/wofi

ln -sf /home/mox/.local/repo/mylin/mox/config/zsh /home/mox/.config/zsh
ln -sf /home/mox/.local/repo/mylin/mox/config/hypr /home/mox/.config/hypr
ln -sf /home/mox/.local/repo/mylin/mox/config/eww /home/mox/.config/eww
ln -sf /home/mox/.local/repo/mylin/mox/config/kitty /home/mox/.config/kitty
ln -sf /home/mox/.local/repo/mylin/mox/config/mako /home/mox/.config/mako
ln -sf /home/mox/.local/repo/mylin/mox/config/wlogout /home/mox/.config/wlogout
ln -sf /home/mox/.local/repo/mylin/mox/config/wofi /home/mox/.config/wofi

cp -r /home/mox/.local/repo/mylin/mox/asstes /home/mox/.local/
# TODO  09/07/23 - 17:28: If-Abfrage ob NVIDIA genutzt wird
sudo cp -r /home/mox/.local/repo/mylin/wayland-sessions/* /usr/share/wayland-sessions/
