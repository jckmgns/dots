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
    sudo pacman -Syu --noconfirm # update package list and start full upgrade

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
    # install and setup nonfree graphics card drivers,
    # via manjaro hardware detection (0300 is the ID for graphics cards)
    echo
    if ask "Do you want to install (nonfree) graphics card drivers?" y; then
        sudo mhwd -a pci nonfree 0300
    fi

    echo
    if ask "Do you want to install wacom drivers?" y; then
        $install libwacom
        # $install xf86-input-wacom
    fi
}

basics() {
    $install yay
    $install pulseaudio-alsa

    $install bash-completion

    # polybar & dependencies
    $install cairo libxcb python2 
    $install xcb-proto xcb-util-image xcb-util-wm xcb-util-xrm
    bash ../packages/polybar.bash

    $install rofi feh picom unclutter rxvt-unicode redshift
}

essentials() {
    # install gvim for clipboard support
    $remove vim # remove terminal-only-vim to avoid conflicts
    $install gvim

    # following packages should already be installed ...
    $install git network-manager lxappearance htop ranger w3m

    # zsh & zprezto
    $install zsh
    git clone git clone --recursive https://github.com/sorin-ionescu/prezto.git "${$HOME}/.zprezto"

    # these are probably not installed
    $install firefox thunderbird thunar libreoffice evince
    $install unzip fzf deepin-screenshot

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
    if ask "Do you want to install discord-canary? (AUR)" y; then
        install_discord
    fi

    echo
    if ask "Do you want to install pulsemixer? (AUR)" y; then
        yay -S  pulsemixer-git
    fi
}

install_discord() {
    # we need to add gpg keys to our keyring to install libc++ (discord dependency)
    (
    tmp_dir="$(mktemp -d)/"
    wget -O "${tmp_dir}libc++.tar.gz" \
        'https://aur.archlinux.org/cgit/aur.git/snapshot/libc%2B%2B.tar.gz'
    tar -xaf "${tmp_dir}libc++.tar.gz" -C ${tmp_dir}
    . $(echo "${tmp_dir}libc++/PKGBUILD")
    for key in ${validpgpkeys[@]}; do
        gpg --recv-key $key
        gpg --lsign $key
    done
    )

    yay -S discord-canary
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
