#!/usr/bin/env bash

# manjaro i3 setup script (mostly basic installation is located here)
# see configure.bash for configuration and setting up of dot-files

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/../lib/ask.bash # import ask function

install='sudo pacman -S --noconfirm'
remove='sudo pacman -R --noconfirm'

main() {
    sudo pacman -Syyuu # update package list and start full upgrade

    basics
    essentials
    additionals
    programming_essentials

    # install and setup nonfree graphics card drivers, 
    # via manjaro hardware detection (0300 is the ID for graphics cards)
    if ask "Do you want to install nonfree graphics card drivers?" y; then
        sudo mhwd -a pci nonfree 0300
    fi

    echo
    echo "Installation of packages finished!"
    if ask "Do you want to configure your system now?" y; then
        bash ./configure.bash
    fi
    
    echo
    echo "Configuration finished!"
    echo "It's recommended that you restart your computer now."
    if ask "Do you want to reboot?" y; then
        sudo shutdown -r 0
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
    $install chromium thunderbird thunar libreoffice evince
    # pacaur -S --noconfirm shutter # shutter is appearantly giant ...


    $install mpd ncmpcpp mpc
    if ask "Do you want to setup mpd for local play?" y; then
        sudo systemctl stop mpd.service
        sudo systemctl disable mpd.service
        echo "Finished configuring mpd!"
    fi
}

programming_essentials() {
    # ycm dependencies
    pacaur --noconfirm -S libtinfo

    # rust
    curl https://sh.rustup.rs -sSf | sh
    rustup component add rust-src # rust-src is needed for completions

    # python
    $install python-pip
    sudo python -m pip install flake8 # linting engine
}

additionals() {
    if ask "Do you want to install krita?" y; then
        $install krita
    fi

    if ask "Do you want to install blender?" y; then
        $install blender 
    fi

    if ask "Do you want to install steam?" y; then
        $install steam 
    fi

    if ask "Do you want to install discord?" y; then
        install_discord 
    fi

    if ask "Do you want to install k3b?" y; then
        $install k3b
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
        echo gpg --recv-key $key
        echo gpg --lsign $key
    done
    )

    pacaur -S --noconfirm discord-canary
}

main
