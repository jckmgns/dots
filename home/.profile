# ~/.bin
export PATH="$HOME/.bin:$PATH"

# editor
export VISUAL="nvim"
export EDITOR="nvim"

# rust
export PATH="$HOME/.cargo/bin:$PATH"
export CARGO_HOME="$HOME/.cargo"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# change shell to zsh
export SHELL=$(which zsh)

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx
fi
