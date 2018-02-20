#!/usr/bin/env bash

REPOSITORY="https://github.com/jaagr/polybar"
DESTINATINON="/opt/polybar"
BUILD_DIR="${DESTINATINON}/build"

main() {
    (
    if [[ -d $DESTINATINON ]]; then
        sudo rm -rf $DESTINATINON
    fi

    sudo git clone --recursive $REPOSITORY $DESTINATINON
    sudo mkdir $BUILD_DIR
    cd $BUILD_DIR
    sudo cmake -DENABLE_I3=ON ..
    sudo make install
    )
}

main
