var prompt-indicator

set edit:prompt = { 
  put "\n"(styled (tilde-abbr $pwd) cyan bold) ^
  "\n"$prompt-indicator" "
}
set edit:rprompt = { put "" }
set edit:-prompt-eagerness = 10
set value-out-indicator = "▶ "

set edit:after-command = [
  {|arg|
    if (eq $arg[error] $nil) {
      set prompt-indicator = (styled ❯ green)
    } else {
      set prompt-indicator = (styled ❯ red)
    }
  }
]
