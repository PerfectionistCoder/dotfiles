fish_user_key_bindings
set fish_cursor_default block
set fish_cursor_insert line

fish_theme

set fish_greeting

function nix-shell
    command nix-shell $argv --command fish
end
function nix
    command nix $argv --command fish
end

zoxide init fish | source
