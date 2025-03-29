use str
use path
use os

fn create {|&force=$false|
  var path = $E:HOME/.cache/elvish/completions.elv

  fn f {
    echo '' > $path
    for dir (conj [] (str:split ':' $E:XDG_DATA_DIRS)) {
      for file [$dir/bash-completion/completions/*[nomatch-ok]] {
        var command = (str:trim-prefix (str:trim-suffix (str:trim-suffix ^
        (path:base $file) '.sh') '.bash') '_')
        carapace-bridge bash $command >> $path
      }
    }
  }

  if (not (os:exists $path)) {
    mkdir -p '/'(str:join '/' (conj [] (str:split '/' $path))[1..-1])
    touch $path
    $f~
  } elif $force {
    $f~
  }

  eval (slurp < $path)
}