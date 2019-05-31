# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Enables symbolic color names
autoload -U colors
colors

# Enable zsh completion
autoload -Uz compinit
compinit

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

# Source fzf key bindings and completion
source  /usr/share/fzf/key-bindings.zsh
source  /usr/share/fzf/completion.zsh

# Disable changing directory to a path stored in a variable.
# (directory module in zprezto)
unsetopt CDABLE_VARS
