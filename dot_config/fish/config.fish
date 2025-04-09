fish_user_key_bindings
set fish_cursor_default block
set fish_cursor_insert line

fish_theme

set fish_greeting

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

zoxide init fish | source
