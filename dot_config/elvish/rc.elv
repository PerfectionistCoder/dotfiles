use ./prompt
use ./bindings
use ./external

set-env CARAPACE_BRIDGES 'bash'
eval (carapace _carapace elvish | slurp)
