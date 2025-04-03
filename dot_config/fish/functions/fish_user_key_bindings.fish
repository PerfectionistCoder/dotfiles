function fish_user_key_bindings
    fish_vi_key_bindings
    bind --preset -ea

    function b
        bind -M $argv
    end
    for mode in default insert
        b $mode enter execute
        b $mode ctrl-l clear-screen
        b $mode ctrl-e edit_command_buffer
        b $mode ctrl-r history-pager

        b $mode backspace backward-delete-char
        b $mode ctrl-backspace backward-kill-word
        b $mode delete delete-char
        b $mode ctrl-delete kill-word
    end

    function b
        bind -M default $argv
    end
    b -m insert i repaint-mode
    b -m insert I beginning-of-line repaint-mode
    b -m insert a forward-char-passive repaint-mode
    b -m insert A end-of-line repaint-mode

    b h backward-char-passive
    b l forward-char-passive
    b k history-prefix-search-backward
    b j history-prefix-search-forward

    b w forward-word
    b W forward-bigword
    b b backward-word
    b B backward-bigword

    b gh beginning-of-line
    b gl end-of-line

    b p fish_clipboard_paste
    b -m insert escape cancel repaint

    function b
        bind -M insert $argv
    end
    b -m default escape repaint-mode
    b '' self-insert
    b " " self-insert expand-abbr
    b ";" self-insert expand-abbr
    b "|" self-insert expand-abbr
    b "&" self-insert expand-abbr
    b "^" self-insert expand-abbr
    b ">" self-insert expand-abbr
    b "<" self-insert expand-abbr
    b ")" self-insert expand-abbr

    b tab complete
    b shift-tab complete-and-search
    b ctrl-tab accept-autosuggestion

    b ctrl-u backward-kill-line
    b ctrl-k kill-line

    functions -e b

    commandline -f repaint-mode
end
