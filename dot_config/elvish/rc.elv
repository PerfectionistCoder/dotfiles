var prompt-indicator = (styled ❯ green)
set edit:prompt = { 
  put "\n  "(styled (tilde-abbr $pwd) cyan bold)^
  "\n  "$prompt-indicator" "
}
set edit:rprompt = { put "" }
set edit:-prompt-eagerness = 10

set edit:after-command = [{|arg|
  if (eq $arg[error] $nil) {
    set prompt-indicator = (styled ❯ green)
  } else {
    set prompt-indicator = (styled ❯ red)
  }
}]

set edit:insert:binding = (edit:binding-table [
  &Ctrl-'['=$edit:command:start~

  &Tab=$edit:completion:smart-start~
  &Enter=$edit:smart-enter~
  &Alt-Enter={ insert-at-dot "\n" }

  &Ctrl-U=$edit:kill-line-left~
  &Ctrl-K=$edit:kill-line-right~

  &Backspace=$edit:kill-rune-left~
  &Delete=$edit:kill-rune-right~
  &Ctrl-H=$edit:kill-rune-left~
  &Ctrl-D=$edit:kill-rune-right~
  &Ctrl-W=$edit:kill-word-left~
  &Alt-d=$edit:kill-word-right~

  &Ctrl-P=$edit:history:start~
  &Ctrl-N=$edit:end-of-history~

  &Ctrl-L={ edit:clear }

  &Alt-r=$edit:histlist:start~
  &Alt-l=$edit:location:start~
  &Alt-n={ $edit:navigation:start~; $edit:navigation:trigger-shown-hidden~ }
])
set edit:global-binding = (edit:binding-table [&])
set edit:command:binding = (edit:binding-table [
  &Ctrl-'['=$edit:close-mode~
  &i=$edit:close-mode~

  &h=$edit:move-dot-left~
  &l=$edit:move-dot-right~
  &j=$edit:move-dot-down~
  &k=$edit:move-dot-up~

  &w=$edit:move-dot-right-small-word~
  &W=$edit:move-dot-right-word~
  &b=$edit:move-dot-left-small-word~
  &B=$edit:move-dot-left-word~

  &0=$edit:move-dot-sol~
  &'$'=$edit:move-dot-eol~
])
set edit:listing:binding = (edit:binding-table [
  &Ctrl-'['=$edit:close-mode~
  &Tab=$edit:listing:down~
  &Shift-Tab=$edit:listing:up~
])
set edit:histlist:binding = (edit:binding-table [&])
set edit:navigation:binding = (edit:binding-table [
  &Ctrl-'['=$edit:close-mode~

  &h=$edit:navigation:left~
  &l=$edit:navigation:right~
  &j=$edit:navigation:down~
  &k=$edit:navigation:up~

  &Enter=$edit:navigation:insert-selected-and-quit~
  &Alt-Enter=$edit:navigation:insert-selected~

  &/=$edit:navigation:trigger-filter~
  &.=$edit:navigation:trigger-shown-hidden~
])
set edit:completion:binding = (edit:binding-table [
  &Ctrl-'['=$edit:close-mode~
  &Tab=$edit:listing:down-cycle~
  &Shift-Tab=$edit:listing:up-cycle~
])
set edit:history:binding = (edit:binding-table [
  &Ctrl-'['=$edit:close-mode~
  &Ctrl-P=$edit:history:up~
  &Ctrl-N=$edit:history:down-or-quit~
])
set edit:lastcmd:binding = (edit:binding-table [&])
set edit:minibuf:binding = (edit:binding-table [&])
