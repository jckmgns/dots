#!/usr/bin/env bash

BLUE="\e[34m" # blue
DFLT="\e[39m" # default

# install packages (which aren't up-to-date)
sudo pacman -S --needed - < pkglist

# yay
if ! hash yay &> /dev/null; then
    echo -e "\n${BLUE}Install yay${DFLT}"

    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si)

    rm -rf /tmp/yay
fi


echo -e "\n${BLUE}Setup complete${DFLT}"
