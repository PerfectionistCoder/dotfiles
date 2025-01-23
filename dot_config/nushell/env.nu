$env.PATH = $env.PATH | prepend ($env.HOME | path join Scripts)

$env.SHELL = "nu"

$env.CARAPACE_BRIDGES = "bash"
$env.CARAPACE_ENV = 1
$env.CARAPACE_HIDDEN = 0
$env.CARAPACE_LENIENT = 1
$env.CARAPACE_MATCH = 1
