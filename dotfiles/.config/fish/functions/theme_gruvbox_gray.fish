function theme_gruvbox_gray
    set -l fg0   FBF1C7
    set -l fg1   EBDBB2
    set -l fg2   D5C4A1
    set -l fg3   BDAE93
    set -l fg4   A89984

    set -l gray  928374

    set -l bg4   7C6F64
    set -l bg3   665C54
    set -l bg2   504945
    set -l bg1   3C3836

    set -l bg0_s 32302F

    set -l bg0   282828

    set -l bg0_h 1D2021

    set -l default $fg1

    # ----------

    set fish_color_command        $fg1

    set fish_color_normal         $fg2

    set fish_color_param          $fg3
    set fish_color_escape         $fg3
    set fish_color_quote          $fg3
    set fish_color_comment        $fg3

    set fish_color_end            $fg4
    set fish_color_redirection    $fg4
    set fish_color_operator       $fg4

    set fish_color_autosuggestion $gray

    set fish_color_error          $bg3

    set fish_color_match          FF0000
    set fish_color_search_match   FF0000
    set fish_color_cancel         FF0000

    set fish_color_search_match   "--background=$bg2"
end
