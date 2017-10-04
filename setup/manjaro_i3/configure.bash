#!/usr/bin/env bash

main() {
    vim_setup
    echo
    echo "Configure script finished!"
}

vim_setup() {
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo | vim +PluginInstall
}

main
