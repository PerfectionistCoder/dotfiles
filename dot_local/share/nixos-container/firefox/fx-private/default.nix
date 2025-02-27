{ ... }@args:
let
  mkContainer = import ../. args;
in
mkContainer {
  name = baseNameOf ./.;
  policies = [
    "dns"
    "private"
    "search-engine"
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
