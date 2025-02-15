{ ... }@args:
let
  mkContainer = import ../. args;
in
mkContainer {
  name = builtins.baseNameOf ./.;
  policies = [
    "common"
    "private"
  ];
  extraConfig = {
    extra.addressPrefix = "192.168.0";
  };
}
