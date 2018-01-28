#!/usr/bin/env bash

main() {
    echo "Synchronising dotfiles ..."
    bash ../../sync.bash

    echo "Configuring vim ..."
    bash ../vimconfig.bash 2> /dev/null

    echo
    echo "Configuration script finished successfully!"
}

main
