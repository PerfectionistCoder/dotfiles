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
    set -f pwd (string replace -r ^$HOME '~' $PWD)

    echo ''
    echo (string join '' $pad $nix_shell (set_color cyan -o) $pwd)

    set -f pointer (string join '' (set_color (if test -n "$IN_NIX_SHELL"; echo blue; else; echo green; end) -o) '▶ ')
    if test $last_status -ne 0
        set pointer (string join '' (set_color red -o) '▶ ')
    end
    echo -n (string join '' $pad $mode ' ' $pointer)
    set_color normal
end

function fish_mode_prompt
end
