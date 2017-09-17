#!/usr/bin/env bash

main() {
    if [[ ! -f "${HOME}/.vim/bundle/Vundle.vim" ]]; then
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi
    echo | vim +PluginInstall +qall # ignore initial warning

    ${HOME}/.vim/bundle/YouCompleteMe/install.py --clang-completer --racer-completer
}

main
