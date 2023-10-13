#!/usr/bin/env bash

BLUE="\e[34m" # blue
DFLT="\e[39m" # default

# install packages (which aren't up-to-date)
sudo pacman -S --needed - < pkglist

# st
if ! hash st &> /dev/null; then
    echo -e "\n${BLUE}Install simple terminal (st)${DFLT}"

    git clone --recurse-submodules https://github.com/jadomag/st.git /tmp/st
    /tmp/st/install

    rm -rf /tmp/st
fi

# yay
if ! hash yay &> /dev/null; then
    echo -e "\n${BLUE}Install yay${DFLT}"

    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si)

    rm -rf /tmp/yay
fi


echo -e "\n${BLUE}Setup complete${DFLT}"
