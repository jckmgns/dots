#!/usr/bin/env bash

ycm_compile_options='--clang-completer --racer-completer'

main() {
    if [[ ! -d "${HOME}/.vim/bundle/Vundle.vim" ]]; then
        echo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi

    echo | vim +PluginInstall +qall # ignore initial warning

    ${HOME}/.vim/bundle/YouCompleteMe/install.py $ycm_compile_options
}

main
