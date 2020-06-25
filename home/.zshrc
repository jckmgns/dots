# Concurrent Configuration
# ------------------------------

if [[ -d "$HOME/.zshrc.d" ]]; then
    for file in "$HOME"/.zshrc.d/*.zsh; do
        source $file
	done
fi

# Prompt
# ------------------------------

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

# External
# ------------------------------

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

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
