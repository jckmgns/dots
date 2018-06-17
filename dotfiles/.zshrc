# Path to oh-my-zsh installation
export ZSH=$HOME/.oh-my-zsh

# ~/.oh-my-zsh/custom/themes/custom.zsh-theme
ZSH_THEME="custom"

# Enable custom ls colors
eval $(dircolors $HOME/.dircolors)

# Enable command auto-correction
ENABLE_CORRECTION="true"

plugins=( fzf-zsh gitfast shrink-path)

source $ZSH/oh-my-zsh.sh
