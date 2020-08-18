# Concurrent Configuration
# ------------------------------

if [[ -d "$HOME/.zshrc.d" ]]; then
    for file in "$HOME"/.zshrc.d/*.zsh; do
        source $file
	done
fi

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
