fish_user_key_bindings
set fish_cursor_default block
set fish_cursor_insert line

fish_theme

set fish_greeting

zoxide init fish | source

function nix-shell
    command nix-shell $argv --command fish
end
function nix
    switch $argv[1]
        case develop
            command nix $argv --command fish
        case '*'
            command nix $argv
    end
end

function on_pwd_change -v PWD
    if test -f $PWD/flake.nix; and test -f $PWD/flake.lock
        nix develop
    else if test -f $PWD/shell.nix
        nix-shell
    end
end
