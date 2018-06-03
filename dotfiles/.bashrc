# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# exec fish if it is installed
if $(command -v fish); then
    exec fish
fi
