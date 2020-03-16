#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/../lib/ask.bash # import ask function

install='sudo pacman -S --noconfirm'
remove='sudo pacman -R --noconfirm'

main() {
    echo "Official packages can be installed without user interaction."
    echo "(AUR packages still needs a user present to read and confirm PKGBUILDS)"
    echo
    if ask "Do you want this installer to be (mostly) non-interactive?" y; then
        install='sudo pacman -S --noconfirm'
        remove='sudo pacman -R --noconfirm'
    else
        install='sudo pacman -S'
        remote='sudo pacman -R'
    fi

    echo
    echo "Updating package list and upgrading already installed packages ..."
    sudo pacman -Syyu --noconfirm # update package list and start full upgrade

    drivers
    basics
    essentials
    additionals
    development

    echo
    echo "Installation of packages finished!"
    echo
    if ask "Do you want to configure your system now?" y; then
        bash ./configure.bash
    fi

    echo
    echo "Configuration finished!"
    echo
    echo "It is recommended that you restart your computer now."
    if ask "Do you want to reboot?" y; then
        sudo shutdown -r 0
    fi
}

drivers() {
    echo
    if ask "Do you want to install (nonfree) graphics card drivers?" y; then
        sudo mhwd -a pci nonfree 0300
    fi

    echo
    if ask "Do you want to install wacom drivers?" y; then
        $install libwacom
    fi
}

basics() {
    $install dunst feh picom polybar redshift rofi rxvt-unicode unclutter
}

essentials() {
    $install firefox flameshot fzf git libreoffice lxappearance noto-fonts-cjk pass thunar thunderbird unzip zsh

    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${HOME}/.zprezto"

    # remove terminal-only vim and install gvim for clipboard support
    $remove vim
    $install gvim

    $install mpd ncmpcpp mpc
    echo
    if ask "Do you want to setup mpd for local playback?" y; then
        sudo systemctl stop mpd.service
        sudo systemctl disable mpd.service
        echo "Finished configuring mpd!"
    fi
}

additionals() {
    echo
    if ask "Do you want to install krita?" y; then
        $install krita
    fi

    echo
    if ask "Do you want to install blender?" y; then
        $install blender
    fi

    echo
    if ask "Do you want to install steam?" y; then
        $install steam linux-steam-integration
    fi

    echo
    if ask "Do you want to install k3b?" y; then
        $install k3b
    fi

    echo
    if ask "Do you want to install discord?" y; then
        $install discord
    fi

    echo
    if ask "Do you want to install pulsemixer? (AUR)" y; then
        $install pulsemixer
    fi
}

development() {
    echo
    echo "Starting Rust installation ..."

    # rust
    curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly
    export PATH="${HOME}/.cargo/bin:${PATH}"
    rustup component add clippy # clippy
    rustup component add rls rust-analysis rust-src # language server
}

main
