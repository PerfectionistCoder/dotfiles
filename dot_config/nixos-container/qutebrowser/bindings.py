c.bindings.default = {}
c.bindings.key_mappings = {}

commands = {
    "normal": {
        "-": "zoom-out",
        ":": "cmd-set-text :",
        "?": "cmd-set-text ?",
        "/": "cmd-set-text /",
        "`": "cmd-set-text -s jump_mark",
        "<Alt-1>": "tab-focus 1",
        "<Alt-2>": "tab-focus 2",
        "<Alt-3>": "tab-focus 3",
        "<Alt-4>": "tab-focus 4",
        "<Alt-5>": "tab-focus 5",
        "<Alt-6>": "tab-focus 6",
        "<Alt-7>": "tab-focus 7",
        "<Alt-8>": "tab-focus 8",
        "<Alt-9>": "tab-focus -1",
        "<Ctrl-,>": "back -q",
        "<Ctrl-.>": "forward -q",
        "<Ctrl-D>": "tab-clone",
        "<Ctrl-J>": "scroll-page 0 0.75",
        "<Ctrl-K>": "scroll-page 0 -0.75",
        "<Ctrl-R>": "reload -f",
        "<Ctrl-Shift-p>": "print",
        "<Ctrl-T>": "open -t",
        "<Ctrl-W>": "tab-close",
        "<Escape>": "clear-keychain ;; search",
        "=": "zoom-in",
        "0": "zoom 0",
        "ba": "cmd-set-text :bookmark-add {url:yank} {title}",
        "bd": "cmd-set-text -s :bookmark-del",
        "bl": "cmd-set-text -s :bookmark-load",
        "dc": "download-cancel",
        "dd": "download-delete",
        "dr": "download-retry",
        "ff": "hint inputs",
        "fid": "hint images download",
        "fio": "hint images tab-fg",
        "fo": "hint all current",
        "fr": "hint --rapid all tab-bg",
        "ft": "hint all tab-fg",
        "fy": "hint all yank",
        "G": "scroll-to-perc 100",
        "gg": "scroll-to-perc 0",
        "h": "scroll-page -0.15 0",
        "j": "scroll-page 0 0.15",
        "k": "scroll-page 0 -0.15",
        "l": "scroll-page 0.15 0",
        "m": "cmd-set-text -s set_mark",
        "n": "search-next",
        "N": "search-prev",
        "O": "cmd-set-text -s :open -t",
        "o": "cmd-set-text -s :open",
        "u": "undo",
        "yl": "yank url",
        "ys": "yank selection",
    },
    "insert": {},
    "hint": {},
    "command": {
        "<Return>": "command-accept",
        "<Tab>": "completion-item-focus next",
        "<Shift-Tab>": "completion-item-focus prev",
    },
    "prompt": {
        "<Return>": "prompt-accept",
        "<Tab>": "prompt-iterm-focus next",
        "<Shift-Tab>": "prompt-iterm-focus prev",
    },
    "yesno": {
        "n": "prompt-accept no",
        "y": "prompt-accept yes",
    },
    "register": {},
}

for mode in commands:
    if mode != "normal":
        commands[mode]["<Escape>"] = "mode-leave"

for mode in ["command", "prompt"]:
    commands[mode].update(
        {
            "<Ctrl-A>": "rl-beginning-of-line",
            "<Ctrl-Backspace>": "rl-backward-kill-word",
            "<Ctrl-D>": "rl-backward-kill-word ;; rl-kill-word",
            "<Ctrl-Delete>": "rl-kill-word",
            "<Ctrl-E>": "rl-end-of-line",
            "<Ctrl-F>": "rl-backward-word",
            "<Ctrl-H>": "rl-backward-char",
            "<Ctrl-K>": "rl-kill-line",
            "<Ctrl-L>": "rl-forward-char",
            "<Ctrl-N>": "command-history-next",
            "<Ctrl-P>": "command-history-prev",
            "<Ctrl-W>": "rl-forward-word",
        }
    )
    for key in [
        "<Up>",
        "<Down>",
        "<Left>",
        "<Right>",
        "<Home>",
        "<End>",
        "<Ctrl-Left>",
        "<Ctrl-Right>",
    ]:
        commands[mode][key] = "nop"

c.bindings.commands = commands
