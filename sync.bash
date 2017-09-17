#/usr/bin/env bash

main() {
    (
    cd ${HOME}/linux-config/dotfiles

    for directory in $(find . -type d); do
        dest_dir="${HOME}/$directory"

        if [[ ! -d dest_dir ]]; then
            mkdir $dest_dir 2> /dev/null
        fi
    done

    for file in $(find . -type f); do
        # replace first occurrence of '.' ... probably not necessary
        # file=$(echo $f | sed 's/.//1') 
        dest_file="${HOME}/${file}"

        if [[ -f $dest_file ]]; then
            mv -f "$dest_file" "${dest_file}.bak" &> /dev/null
        fi

        ln -f $file $dest_file 
    done
    )
}

main
