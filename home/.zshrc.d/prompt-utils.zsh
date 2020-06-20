#!/usr/bin/env zsh

function fish-pwd {
    local directory="${PWD/#$HOME/~}"
    local result

    if [[ "$directory" == (#m)[/~] ]]; then
        result="$MATCH"
        unset MATCH
    else
        result="${${${${(@j:/:M)${(@s:/:)directory}##.#?}:h}%/}//\%/%%}/${${directory:t}//\%/%%}"
    fi

    print "$result"
}

function rprompt {
    local exit_status=$?
    local result

    if [[ $exit_status != 0 ]]; then
        result="%B%F{red}[$exit_status]%f%b"
    else
        result="%B%F{magenta}%*%f"
    fi

    print $result
}
