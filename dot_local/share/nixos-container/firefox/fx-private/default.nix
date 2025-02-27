{ ... }@args:
let
  mkContainer = import ../. args;
in
mkContainer {
  name = builtins.baseNameOf ./.;
  policies = [
    "private"
    "ublock-origin"
  ];
  bookmarks = import ./bookmarks.nix;
  extraConfig = {
    extra.addressPrefix = "192.168.0";
  };
}
