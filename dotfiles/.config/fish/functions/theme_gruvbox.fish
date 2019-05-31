function theme_gruvbox
    set -l color0  282828
    set -l color1  CC241D
    set -l color2  98971A
    set -l color3  D79921
    set -l color4  458588
    set -l color5  B16286
    set -l color6  689D6A
    set -l color7  A89984

    set -l color8  928374
    set -l color9  FB4934
    set -l color10 B8BB26
    set -l color11 FABD2F
    set -l color12 83A598
    set -l color13 D3869B
    set -l color14 8EC07C
    set -l color15 EBDBB2

    # orange
    set -l coloro0 D65D0E
    set -l coloro1 FE8019

    set -l colorbg0_h 1D2021
    set -l colorbg0_s 32302F
    set -l colorbg0   282828
    set -l colorbg1   3C3836
    set -l colorbg2   504945
    set -l colorbg3   665C54
    set -l colorbg4   7C6F64

    set -l colorfg0   FBF1C7
    set -l colorfg1   EBDBB2
    set -l colorfg2   D5C4A1
    set -l colorfg3   BDAE93
    set -l colorfg4   A89984

    set fg -l $color15

    # ----------

    set fish_color_normal         $fg
    set fish_color_command        $color12
    set fish_color_quote          $color2
    set fish_color_redirection    $fg
    set fish_color_end            $coloro1
    set fish_color_error          $color1
    set fish_color_param          $fg
    set fish_color_comment        $color7
    set fish_color_match          $color12
    set fish_color_search_match   $color12
    set fish_color_operator       $color14
    set fish_color_autosuggestion $color7

    set fish_color_escape         $color8
    set fish_color_cancel         $color8

    set fish_color_cwd            $color12 -o
    set fish_color_user           $color2 -o
    set fish_color_host           $color2 -o

    set fish_color_search_match   "--background=$colorbg2"
end
