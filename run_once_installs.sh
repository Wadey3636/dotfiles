#!/bin/bash

sudo pacman -S --needed git
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo pacman -Syu
pacman -S niri
cd ~/

source ./scripts/install_paru.sh
bash ./scripts/install_zsh.sh

sudo pacman -S --needed --noconfirm ttf-jetbrains-mono-nerd curl unzip kitty seahorse xwayland-satellite fzf btop fastfetch ripgrep tmux adw-gtk-theme neovim wl-clipboard
sudo pacman -S --needed --noconfirm yazi jq poppler fd resvg imagemagick tree-sitter-cli
sudo pacman -R --needed alacritty nautilus

rustup component add rust-analyzer

paru -S --needed --norebuild noctalia-shell vesktop 1password spicetify paru libadwaita-without-adwaita zen-browser-bin nordzy-icon-theme spotify

if ! [ -d "/usr/share/sddm/themes/sddm-astronaut-theme" ]; then
    while true; do
        read -p "Do you wish to install Sddm Astronaut Theme? [y/n] " yn
        case $yn in
            [Yy]*)
                echo "Installing Astronaut theme"
                bash -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"
                break
                ;;
            [Nn]*)
                echo "Skipping Astronaut theme installation."
                break
                ;;
            *)
                echo "Please answer y or n."
                ;;
        esac
    done
fi


gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
gtk4-update-icon-cache

bash ./scripts/setup_noctalia_templates.sh
xdg-mime default yazi.desktop inode/directory
