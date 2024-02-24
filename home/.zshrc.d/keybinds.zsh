#!/usr/bin/env zsh

stty -ixon

bindkey -e

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kich1]}" overwrite-mode
bindkey "${terminfo[kdch1]}" delete-char
bindkey "${terminfo[kcuu1]}" up-line-or-history
bindkey "${terminfo[kcud1]}" down-line-or-history
bindkey "${terminfo[kcub1]}" backward-char
bindkey "${terminfo[kcuf1]}" forward-char

# fzf git keybinds

_fzf_git_status() {
    # check if we're in a git repository.
    git rev-parse HEAD > /dev/null 2>&1 || return

    # display fzf populated by modified git files.
    local result=$(
        git --no-pager -c color.status=always status --short |
        fzf --height 50% --layout=reverse --ansi -m |
        cut -c4- |
        xargs
    )

    zle reset-prompt
    LBUFFER+=$result
}

zle -N _fzf_git_status
bindkey "" _fzf_git_status
