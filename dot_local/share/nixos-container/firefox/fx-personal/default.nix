{ ... }@args:
let
  mkContainer = import ../. args;
in
mkContainer {
  name = builtins.baseNameOf ./.;
  extraConfig = {
    extra.addressPrefix = "192.168.1";
  };
}
