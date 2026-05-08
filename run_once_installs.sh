#!/bin/bash

sudo pacman -S --needed git
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo pacman -Syu
cd ~/

source ./scripts/install_paru.sh
bash ./scripts/install_zsh.sh

sudo pacman -S --needed --noconfirm ttf-jetbrains-mono-nerd curl unzip kitty seahorse xwayland-satellite fzf btop fastfetch ripgrep tmux adw-gtk-theme neovim wl-clipboard
sudo pacman -S --needed --noconfirm yazi jq poppler fd resvg imagemagick tree-sitter-cli
sudo pacman -R --needed alacritty nautilus

paru -S --needed --norebuild noctalia-shell vesktop 1password spicetify paru libadwaita-without-adwaita zen-browser-bin

if [ -d "/usr/share/sddm/themes/sddm-astronaut-theme" ]; then
    echo "Astronaut theme installed"
else
    echo "Installing Astronaut theme"
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"
    rm -rf sddm-astronaut-theme
fi

gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
gtk4-update-icon-cache

bash ./scripts/setup_noctalia_templates.sh
xdg-mime default yazi.desktop inode/directory
