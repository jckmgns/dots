# Alias
# ------------------------------

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

alias feh='feh --draw-filename --auto-zoom --scale-down --sort name --version-sort'

# Completion
# ------------------------------

autoload -Uz compinit && compinit # Tab completions

# Completion to include menu selection, case insensitive and match in words
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list	'' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

# History
# ------------------------------

export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Keybinds
# ------------------------------

stty -ixon

bindkey -e

bindkey "\033[H" beginning-of-line
bindkey "\033[4~" end-of-line
bindkey "\033[P" delete-char

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

# Prompt
# ------------------------------

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

# Usability
# ------------------------------

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

# External
# ------------------------------

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_COMMAND='rg --files'
export FZF_DEFAULT_OPTS='--no-color --reverse --height 50%'

export FZF_CTRL_T_COMMAND='rg --files'
export FZF_CTRL_T_OPTS='--preview "head --lines 100 {}"'

# Plugins
# ------------------------------

if [[ ! -f "$HOME/.local/share/zsh/antigen.zsh" ]]; then
    curl -L --create-dirs git.io/antigen -o "$HOME/.local/share/zsh/antigen.zsh"
fi
source "$HOME/.local/share/zsh/antigen.zsh"

antigen bundle ael-code/zsh-colored-man-pages # colored man pages
antigen bundle popstas/zsh-command-time # show execution time for long commands
antigen bundle zsh-users/zsh-completions # additional completion definitions
antigen bundle zsh-users/zsh-syntax-highlighting # fish-like syntax highlighting

antigen apply
