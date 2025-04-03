function fish_theme
    set -f rosewater f5e0dc
    set -f flamingo f2cdcd
    set -f pink f5c2e7
    set -f mauve cba6f7
    set -f red f38ba8
    set -f maroon eba0ac
    set -f peach fab387
    set -f yellow f9e2af
    set -f green a6e3a1
    set -f teal 94e2d5
    set -f sky 89dceb
    set -f sapphire 74c7ec
    set -f blue 89b4fa
    set -f lavender b4befe
    set -f text cdd6f4
    set -f subtext1 bac2de
    set -f subtext0 a6adc8
    set -f overlay2 9399b2
    set -f overlay1 7f849c
    set -f overlay0 6c7086
    set -f surface2 585b70
    set -f surface1 45475a
    set -f surface0 313244
    set -f base 1e1e2e
    set -f mantle 181825
    set -f crust 11111b

    set -gx fish_color_normal $text
    set -gx fish_color_command $blue
    set -gx fish_color_keyword $mauve
    set -gx fish_color_quote $green
    set -gx fish_color_rediretor $sky
    set -gx fish_color_end $overlay2
    set -gx fish_color_error $red
    set -gx fish_color_param
    set -gx fish_color_valid_path $teal
    set -gx fish_color_option $maroon
    set -gx fish_color_comment $overlay2
    set -gx fish_color_selection
    set -gx fish_color_operator $peach
    set -gx fish_color_escape $pink
    set -gx fish_color_autosuggestion $overlay2
    set -gx fish_color_cancel
    set -gx fish_color_search_match
    set -gx fish_color_history_current

    set -gx fish_pager_color_progress $base -b $text
    set -gx fish_pager_color_background
    set -gx fish_pager_color_prefix
    set -gx fish_pager_color_completion
    set -gx fish_pager_color_description
    set -gx fish_pager_color_selected_background -r
    set -gx fish_pager_color_selected_prefix
    set -gx fish_pager_color_selected_completion
    set -gx fish_pager_color_selected_description
    set -gx fish_pager_color_secondary_background
    set -gx fish_pager_color_secondary_prefix
    set -gx fish_pager_color_secondary_completion
    set -gx fish_pager_color_secondary_description
end
