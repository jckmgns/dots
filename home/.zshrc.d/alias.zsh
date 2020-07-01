#!/usr/bin/env zsh

# setopt correct
#
# disable correction
# alias cd='nocorrect cd'
# alias cp='nocorrect cp'
# alias gcc='nocorrect gcc'
# alias grep='nocorrect grep'
# alias ln='nocorrect ln'
# alias man='nocorrect man'
# alias mkdir='nocorrect mkdir'
# alias mv='nocorrect mv'
# alias rg='nocorrect rg'
# alias rm='nocorrect rm'

# disable globbing
alias fc='noglob fc'
alias find='noglob find'
alias ftp='noglob ftp'
alias history='noglob history'
alias locate='noglob locate'
alias rsync='noglob rsync'
alias scp='noglob scp'
alias sftp='noglob sftp'

# list aliases
alias ls="ls --color -h --group-directories-first --time-style=long-iso"

alias l='ls -1A'
alias ll='ls -lh'
alias lr='ll -R'
alias la='ll -A'
alias lm='la | "$PAGER"'
alias lx='ll -XB'
alias lk='ll -Sr'
alias lt='ll -tr'
alias lc='lt -c'
alias lu='lt -u'
alias sl='ls'
