# ~/bin
export PATH="$HOME/.bin:$PATH"

# rust
export PATH="$HOME/.cargo/bin:$PATH"
export CARGO_HOME="$HOME/.cargo"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# change shell to zsh
export SHELL=$(which zsh)
