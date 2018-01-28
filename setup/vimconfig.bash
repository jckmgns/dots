#!/usr/bin/env bash

vundle_dir="$HOME/.vim/bundle/Vundle.vim/"

main() {
    if [[ ! -d $vundle_dir ]]; then
        git clone https://github.com/VundleVim/Vundle.vim.git $vundle_dir
    fi

    echo | vim +PluginInstall
}

main
