c.bindings.default = {}
c.bindings.key_mappings = {}

commands = {
    "normal": {
        ":": "cmd-set-text :",
        "?": "cmd-set-text ?",
        "/": "cmd-set-text /",
        "`": "mode-enter jump_mark",
        "<Alt-1>": "tab-focus 1",
        "<Alt-2>": "tab-focus 2",
        "<Alt-3>": "tab-focus 3",
        "<Alt-4>": "tab-focus 4",
        "<Alt-5>": "tab-focus 5",
        "<Alt-6>": "tab-focus 6",
        "<Alt-7>": "tab-focus 7",
        "<Alt-8>": "tab-focus 8",
        "<Alt-9>": "tab-focus -1",
        "<Ctrl-->": "zoom-out",
        "<Ctrl-=>": "zoom-in",
        "<Ctrl-0>": "zoom 0",
        "<Ctrl-C>": "yank selection",
        "<Ctrl-D>": "tab-clone",
        "<Ctrl-R>": "reload -f",
        "<Ctrl-Shift-C>": "yank url",
        "<Ctrl-Shift-P>": "print",
        "<Ctrl-Shift-T>": "undo",
        "<Ctrl-W>": "tab-close",
        "<Escape>": "clear-keychain ;; clear-messages ;; search ;; mode-enter caret ;; selection-drop ;; mode-leave",
        "<Return>": "selection-follow",
        "ba": "cmd-set-text :bookmark-add {url:yank} {title}",
        "bd": "cmd-set-text -s :bookmark-del",
        "bl": "cmd-set-text -s :bookmark-load",
        "dc": "download-cancel",
        "dd": "download-delete",
        "dr": "download-retry",
        "f": "hint",
        "G": "scroll-to-perc 100",
        "gg": "scroll-to-perc 0",
        "H": "back -q",
        "h": "scroll-page -0.2 0",
        "i": "mode-enter insert",
        "j": "scroll-page 0 0.2",
        "J": "tab-next",
        "k": "scroll-page 0 -0.2",
        "K": "tab-prev",
        "L": "forward -q",
        "l": "scroll-page 0.2 0",
        "m": "cmd-set-text -s :set_mark",
        "n": "search-next",
        "N": "search-prev",
        "O": "cmd-set-text -s :open -t",
        "o": "cmd-set-text -s :open",
    },
    "insert": {},
    "hint": {
        "<Ctrl-R>": "hint --rapid all tab-bg",
        "<Ctrl-T>": "hint all tab-fg",
        "<Ctrl-Y>": "hint all yank",
    },
    "command": {
        "<Return>": "command-accept",
        "<Shift-Tab>": "completion-item-focus prev",
        "<Tab>": "completion-item-focus next",
    },
    "prompt": {
        "<Return>": "prompt-accept",
        "<Shift-Tab>": "prompt-iterm-focus prev",
        "<Tab>": "prompt-iterm-focus next",
        "y": "prompt-yank",
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
