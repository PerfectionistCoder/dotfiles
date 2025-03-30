set edit:insert:binding = (edit:binding-table [&])
set edit:global-binding = (edit:binding-table [&])
set edit:command:binding = (edit:binding-table [&])
set edit:listing:binding = (edit:binding-table [&])
set edit:histlist:binding = (edit:binding-table [&])
set edit:navigation:binding = (edit:binding-table [&])
set edit:completion:binding = (edit:binding-table [&])
set edit:history:binding = (edit:binding-table [&])
set edit:lastcmd:binding = (edit:binding-table [&])
set edit:minibuf:binding = (edit:binding-table [&])

{
  var b = {|k f| set edit:global-binding[$k] = $f }

  $b C-'[' $edit:close-mode~
  $b C-L { edit:clear }
}

{
  var b = {|k f| set edit:insert:binding[$k] = $f }

  $b C-'[' $edit:command:start~

  $b Tab $edit:completion:smart-start~
  $b Enter $edit:smart-enter~
  $b Alt-Enter { $edit:insert-at-dot~ "\n" }

  $b C-U $edit:kill-line-left~
  $b C-K $edit:kill-line-right~

  $b Backspace $edit:kill-rune-left~
  $b Delete $edit:kill-rune-right~
  $b C-H $edit:kill-rune-left~
  $b C-D $edit:kill-rune-right~

  $b C-W $edit:kill-small-word-left~
  $b Alt-d $edit:kill-small-word-right~
  $b Alt-Backspace $edit:kill-small-word-left~
  $b Alt-Delete $edit:kill-small-word-right~

  $b C-P $edit:history:start~
  $b C-N $edit:end-of-history~

  $b Alt-r $edit:histlist:start~
  $b Alt-l $edit:location:start~
  $b Alt-n { $edit:navigation:start~; $edit:navigation:trigger-shown-hidden~ }
}

{
  var b = {|k f| set edit:command:binding[$k] = $f }

  $b i $edit:close-mode~

  $b h $edit:move-dot-left~
  $b l $edit:move-dot-right~
  $b j $edit:move-dot-down~
  $b k $edit:move-dot-up~

  $b w $edit:move-dot-right-small-word~
  $b W $edit:move-dot-right-word~
  $b b $edit:move-dot-left-small-word~
  $b B $edit:move-dot-left-word~

  $b 0 $edit:move-dot-sol~
  $b '$' $edit:move-dot-eol~
}

{
  var b = {|k f| set edit:listing:binding[$k] = $f }

  $b Tab $edit:listing:down~
  $b Shift-Tab $edit:listing:up~
}

{
  var b = {|k f| set edit:navigation:binding[$k] = $f }

  $b C-'[' $edit:close-mode~

  $b h $edit:navigation:left~
  $b l $edit:navigation:right~
  $b j $edit:navigation:down~
  $b k $edit:navigation:up~

  $b Enter $edit:navigation:insert-selected-and-quit~
  $b Alt-Enter $edit:navigation:insert-selected~

  $b / $edit:navigation:trigger-filter~
  $b . $edit:navigation:trigger-shown-hidden~

  $b Alt-n $nop~
}

{
  var b = {|k f| set edit:completion:binding[$k] = $f }

  $b Tab $edit:listing:down-cycle~
  $b Shift-Tab $edit:listing:up-cycle~
}

{
  var b = {|k f| set edit:history:binding[$k] = $f }

  $b C-P $edit:history:up~
  $b C-N $edit:history:down-or-quit~
}