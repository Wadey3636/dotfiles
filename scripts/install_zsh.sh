#!/bin/bash

echo "$SHELL"

sudo pacman -S --needed zsh zoxide curl

if [[ "$SHELL" == "/usr/bin/zsh" || "$SHELL" == "/bin/zsh" ]]; then
    echo "Running in zsh"
else 
    echo "Setting zsh to default shell"
    chsh -s $(which zsh)
fi

