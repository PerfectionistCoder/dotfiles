c.bindings.default = {}
c.bindings.key_mappings = {}

commands = {
    "normal": {
        "-": "zoom-out",
        ":": "cmd-set-text :",
        "?": "cmd-set-text ?",
        "[": "tab-prev",
        "]": "tab-next",
        "/": "cmd-set-text /",
        "`": "cmd-set-text -s jump_mark",
        "<Ctrl-,>": "back -q",
        "<Ctrl-.>": "forward -q",
        "<Ctrl-[>": "tab-move -",
        "<Ctrl-]>": "tab-move +",
        "<Ctrl-R>": "reload -f",
        "<Ctrl-W>": "tab-close",
        "D": "tab-clone",
        "<Escape>": "clear-keychain ;; search",
        "=": "zoom-in",
        "0": "zoom 0",
        "1": "tab-focus 1",
        "2": "tab-focus 2",
        "3": "tab-focus 3",
        "4": "tab-focus 4",
        "5": "tab-focus 5",
        "6": "tab-focus 6",
        "7": "tab-focus 7",
        "8": "tab-focus 8",
        "9": "tab-focus -1",
        "ba": "cmd-set-text :bookmark-add {url:yank} {title}",
        "bd": "cmd-set-text -s :bookmark-del",
        "bl": "cmd-set-text -s :bookmark-load",
        "dc": "download-cancel",
        "dd": "download-delete",
        "dr": "download-retry",
        "ff": "hint all current",
        "fid": "hint images download",
        "fio": "hint images tab-fg",
        "fr": "hint --rapid all tab-bg",
        "ft": "hint all tab-fg",
        "fy": "hint all yank",
        "G": "scroll-to-perc 100",
        "gg": "scroll-to-perc 0",
        "h": "scroll-page -0.15 0",
        "j": "scroll-page 0 0.15",
        "J": "scroll-page 0 1",
        "k": "scroll-page 0 -0.15",
        "K": "scroll-page 0 -1",
        "l": "scroll-page 0.15 0",
        "m": "cmd-set-text -s set_mark",
        "n": "search-next",
        "N": "search-prev",
        "O": "cmd-set-text -s :open -t",
        "o": "cmd-set-text -s :open",
        "p": "print",
        "t": "open -t",
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
            "<Alt-B>": "rl-backward-word",
            "<Alt-D>": "rl-kill-word",
            "<Alt-F>": "rl-forward-word",
            "<Ctrl-A>": "rl-beginning-of-line",
            "<Ctrl-B>": "rl-backward-char",
            "<Ctrl-D>": "rl-delete-char",
            "<Ctrl-E>": "rl-end-of-line",
            "<Ctrl-F>": "rl-forward-char",
            "<Ctrl-H>": "rl-backward-delete-char",
            "<Ctrl-K>": "rl-kill-line",
            "<Ctrl-N>": "command-history-next",
            "<Ctrl-P>": "command-history-prev",
            "<Ctrl-W>": "rl-backward-kill-word",
        }
    )

c.bindings.commands = commands
