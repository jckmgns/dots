#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() {
    create_links
}

create_links() {
    local source="$DIR/home"
    local backup_root="$DIR/backup/home"
    local backup="${backup_root}/$(date +"%Y-%m-%d_%T")"

    # create missing directories ...
    for dir in $(find ${source} -type d); do
        target_dir=${dir/$source\//$HOME/}
        backup_dir=${dir/$source\//$backup/}

        mkdir -p $backup_dir
        if [[ ! -d $target_dir ]]; then
            mkdir $target_dir
        fi
    done

    mkdir -p $backup

    for file in $(find ${source} -type f); do
        target_file=${file/$source\//$HOME/}
        backup_file=${file/$source\//$backup/}

        # backup if target file exists and is not a link
        if [[ -f $target_file ]] && [[ ! -L $target_file ]]; then
            cp $target_file $backup_file
            rm $target_file
        fi

        ln -f -s $file $target_file
    done

    # cleanup backup directory 
    find $backup_root -type d -empty -delete
}

main
