#/usr/bin/env bash

main() {
    for directory in $(find "${HOME}/linux-config/dotfiles/" -type d); do
        dest_dir="${HOME}/$directory"

        if [[ ! -d dest_dir ]]; then
            mkdir $dest_dir 2> /dev/null
        fi
    done

    for file in $(find "${HOME}/linux-config/dotfiles/" -type f); do
        # replace first occurrence of '.' ... probably not necessary
        # file=$(echo $f | sed 's/.//1') 
        dest_file="${HOME}/${file}"

        if [[ -f $dest_file ]]; then
            mv -f "$dest_file" "${dest_file}.bak" &> /dev/null
        fi

        ln -f -s $file $dest_file 
    done
}

main
