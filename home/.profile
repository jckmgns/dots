# ~/.bin
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# editor
export VISUAL="nvim"
export EDITOR="nvim"

# Fix for font scaling of applications based on winit (e.g., Neovide).
export WINIT_X11_SCALE_FACTOR=1

# rust
export PATH="$HOME/.cargo/bin:$PATH"
export CARGO_HOME="$HOME/.cargo"

# c/c++
export CC=clang
export CXX=clang

# change shell to zsh
export SHELL=$(which zsh)

# FZF
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_DEFAULT_OPTS='--no-color --reverse --height 50%'

export FZF_CTRL_T_COMMAND='fd --type file'
export FZF_CTRL_T_OPTS='--no-preview'

# autostart X (i3) on login from tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx
fi
