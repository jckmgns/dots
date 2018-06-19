# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Enables symbolic color names
autoload -U colors
colors

# Source custom prompts folder
fpath=( "$HOME/.zprompts" $fpath )
promptinit

# Set custom prompt (~/.zprompts/prompt_custom_setup)
prompt custom

# Overwrite LS_COLORS with custom settings
eval $(dircolors -b $HOME/.dircolors)

# Enable interactive and colored completion menu
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
