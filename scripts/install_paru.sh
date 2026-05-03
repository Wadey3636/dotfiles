#!/bin/bash

if ! command -v paru &> /dev/null; then
  echo "paru not found, installing..."
  sudo pacman -S --needed base-devel rustup
  rustup toolchain install stable
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si
  cd ..
  rm -rf paru
  hash -r 2>/dev/null || true
else
  echo "paru is already installed"
fi
