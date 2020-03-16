#!/usr/bin/env bash

main() {
    echo "Synchronising dotfiles ..."
    bash ../../sync.bash

    echo "Configuring vim ..."
    bash ../vimconfig.bash 2> /dev/null

    # echo "Setting Zsh as default shell ..."
    # chsh -s $(which zsh)

    echo
    echo "Configuration script finished successfully!"
}

main
