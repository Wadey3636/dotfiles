#!/bin/bash

if ! command -v paru &> /dev/null; then
  echo "paru not found, installing..."
  sudo pacman -S --needed base-devel rustup
  rustup install default
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -s
  cd $HOME
  rm -rf paru
else
  echo "paru is already installed"
fi
