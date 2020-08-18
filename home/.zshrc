# Concurrent Configuration
# ------------------------------

if [[ -d "$HOME/.zshrc.d" ]]; then
    for file in "$HOME"/.zshrc.d/*.zsh; do
        source $file
	done
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
