function fish_prompt
    set -f last_status $status
    set -f pad '  '

    function echo
        builtin echo -ne $argv
    end

    echo "\n$pad"
    if test -n "$IN_NIX_SHELL"
        set_color blue
        echo '  '
    end
    set_color cyan -o
    echo (string replace -r ^$HOME '~' $PWD)

    echo "\n$pad"
    switch $fish_bind_mode
        case default
            set_color -o normal
            echo '[N] '
        case insert
            set_color -o green
            echo '[I] '
        case '*'
            return 1
    end
    if test $last_status -eq 0
        set_color green -o
        echo '▶ '
    else
        set_color red -o
        echo '▶ '
    end
    set_color normal
end

function fish_mode_prompt
end
