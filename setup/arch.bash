#!/usr/bin/env bash

BLUE="\e[34m" # blue
DFLT="\e[39m" # default

# Install packages (that are not up-to-date)
sudo pacman -S --needed - < pkglist

# Simple Terminal
if ! hash st &> /dev/null; then
    echo -e "\n${BLUE}Install simple terminal (st)${DFLT}"

    git clone --recurse-submodules https://github.com/jadomag/stw /tmp/stw
    /tmp/stw/install

    rm -rf /tmp/stw
fi

# MPD
echo -e "\n${BLUE}Setup MPD for local playback${DFLT}"

sudo systemctl stop mpd.service
sudo systemctl disable mpd.service

# Rust
if ! hash rustup &> /dev/null; then
    echo -e "\n${BLUE}Start Rust installation${DFLT}"

    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    export PATH="${HOME}/.cargo/bin:${PATH}"

    rustup component add clippy # clippy
    rustup component add rls rust-analysis rust-src # language server
fi

# yay
if ! hash yay &> /dev/null; then
    echo -e "\n${BLUE}Start yay installation${DFLT}"

    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si)

    rm -rf /tmp/yay
fi


echo -e "\n${BLUE}Setup complete${DFLT}"
