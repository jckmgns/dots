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
    local result=""

    if [[ $exit_status != 0 ]]; then
        result="%B%F{red}[$exit_status]%f%b"
    fi

    print $result
}

autoload -Uz colors && colors

setopt prompt_subst

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:git:*' formats ' (%b)'

local dir='%B%F{blue}$(fish-pwd)%f%b'
local vcs='%B%F{yellow}${vcs_info_msg_0_}%f%b'

PROMPT=" $dir$vcs %% "
RPROMPT='$(rprompt)'
