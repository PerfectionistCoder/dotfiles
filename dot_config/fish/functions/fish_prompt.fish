function fish_prompt
    set -f last_status $status
    set -f pad '  '
    set -f mode (switch $fish_bind_mode
        case default
            set_color -o normal
            echo -n '[N]'
        case insert
            set_color -o green
            echo -n '[I]'
        case '*'
            return 1
    end)

    echo ''
    echo (string join '' -- $pad (set_color cyan -o) (prompt_pwd))

    set -f pointer (string join '' (set_color green -o) '> ')
    if test $last_status -ne 0
        set pointer (string join '' (set_color red -o) '> ')
    end
    echo -n (string join '' --  $pad $mode ' ' $pointer (set_color normal))
end

function fish_mode_prompt
end
