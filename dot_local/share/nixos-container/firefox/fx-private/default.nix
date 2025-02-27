{ ... }@args:
let
  mkContainer = import ../. args;
in
mkContainer {
  name = baseNameOf ./.;
  policies = [
    "private"
    "ublock-origin"
  ];
  bookmarks = [
    "firefox"
    "nix"
    "youtube"
  ];
  extraConfig = {
    extra.addressPrefix = "192.168.0";
  };
}
