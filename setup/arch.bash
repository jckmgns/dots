#!/usr/bin/env bash

BLUE="\e[34m" # blue
DFLT="\e[39m" # default

main() {
    sudo pacman -S --needed - < pkglist

    mpd
    rust
    yay

    echo -e "\n${BLUE}Setup complete${DFLT}"
}

mpd() {
    echo -e "\n${BLUE}Setup MPD for local playback${CLEAR}"

    sudo systemctl stop mpd.service
    sudo systemctl disable mpd.service
}

rust() {
    echo -e "\n${BLUE}Start Rust installation${DFLT}"

    curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly
    export PATH="${HOME}/.cargo/bin:${PATH}"
    rustup component add clippy # clippy
    rustup component add rls rust-analysis rust-src # language server
}

yay() {
    if ! command -v yay &> /dev/null; then
        echo -e "\n${BLUE}Start yay installation${DFLT}"

        git clone https://aur.archlinux.org/yay.git /tmp/yay
        (cd /tmp/yay && makepkg -si)

        rm -rf /tmp/yay
    fi
}

main
