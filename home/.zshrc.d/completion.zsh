#!/usr/bin/env zsh

autoload -Uz compinit && compinit # Tab completions

# Completion to include menu selection, case insensitive and match in words
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list	'' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
