#!/bin/bash

sudo pacman -Sy
sudo pacman -S --needed git
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo pacman -Sy

bash ./install_paru.sh
bash ./install_zsh.sh

sudo pacman -S ttf-jetbrains-mono-nerd curl unzip kitty seahorse xwayland-satellite fzf btop fastfetch
sudo pacman -R alacritty

paru -S noctalia-shell vesktop 1password spicetify

if [ -d "/usr/share/sddm/themes/sddm-astronaut-theme" ]; then
    echo "Astronaut theme installed"
else
    echo "Installing Astronaut theme"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"
fi



xdg-mime default org.gnome.Nautilus.desktop inode/directory
