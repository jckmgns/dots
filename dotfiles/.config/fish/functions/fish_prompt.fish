function fish_prompt
    set_color -o green
    printf (whoami)
    set_color normal
    printf "@"
    set_color -o green
    printf (hostname)

    set_color normal
    printf ' '

    set_color -o brblue
    printf (prompt_pwd)


    set_color -o yellow
    printf (__fish_git_prompt) ""

    set_color normal
    printf ' > '
end
