#!/usr/bin/env bash

# manjaro i3 setup script (mostly basic installation is located here)
# see configure.bash for configuration and setting up of dot-files

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
    sudo pacman -Syyuu --noconfirm # update package list and start full upgrade

    drivers
    basics
    essentials
    additionals
    programming_essentials


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
    $install pacaur
    $install pulseaudio-alsa

    $install bash-completion

    # i3blocks & dependencies
    $install acpi sysstat playerctl 
    $install i3blocks

    $install rofi feh compton unclutter rxvt-unicode
}

essentials() {
    # install gvim for clipboard support
    $remove vim # remove terminal-only-vim to avoid conflicts
    $install gvim

    # following packages should already be installed ...
    $install git network-manager lxappearance htop ranger w3m                    

    # these are probably not installed
    $install chromium thunderbird thunar libreoffice evince unzip
    # pacaur -S --noconfirm shutter # shutter is appearantly giant ...


    $install mpd ncmpcpp mpc
    echo
    if ask "Do you want to setup mpd for local play?" y; then
        sudo systemctl stop mpd.service
        sudo systemctl disable mpd.service
        echo "Finished configuring mpd!"
    fi
}

programming_essentials() {
    # ycm dependencies
    echo y | pacaur -S libtinfo5 # could be deprecated in the future ...

    # rust
    curl https://sh.rustup.rs -sSf | sh
    rustup component add rust-src # rust-src is needed for completions

    # python
    $install python-pip
    sudo python -m pip install flake8 # linting engine

    # other
    $install ctags
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
        $install steam 
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
        echo y | pacaur -S  pulsemixer-git
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

    'y' | pacaur -S discord-canary
}

main
