#!/usr/bin/env zsh

# treat these characters as part of a word
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

setopt autocd # change directory without `cd`
setopt autopushd # make cd work like pushd
setopt extendedglob # extended globbing, eg. `cp ^*.(tar`
setopt extendedhistory # add more info to history
setopt nocorrectall # disable command correction

# custom color setup for ls
if [ -x "$(command -v dircolors)" ]; then
    if [[ -s "$HOME/.dircolors" ]]; then
        eval "$(dircolors --sh "$HOME/.dircolors")"
    else
        eval "$(dircolors --sh)"
    fi
fi
