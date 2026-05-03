#!/bin/bash

sudo pacman -S --needed git
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo pacman -Syu
cd ~/

source ./scripts/install_paru.sh
bash ./scripts/install_zsh.sh

sudo pacman -S --needed ttf-jetbrains-mono-nerd curl unzip kitty seahorse xwayland-satellite fzf btop fastfetch ripgrep tmux adw-gtk-theme
sudo pacman -R --needed alacritty

paru -S --needed --norebuild noctalia-shell vesktop 1password spicetify

if [ -d "/usr/share/sddm/themes/sddm-astronaut-theme" ]; then
    echo "Astronaut theme installed"
else
    echo "Installing Astronaut theme"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"
    rm -rf sddm-astronaut-theme
fi

gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'  # or 'prefer-light'

xdg-mime default org.gnome.Nautilus.desktop inode/directory
