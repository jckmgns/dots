# disable greeting
set fish_greeting ""

# set custom dircolors
if test -r ~/.dircolors
    eval (dircolors -c ~/.dircolors)
end

# call theme setting script
theme_gruvbox
