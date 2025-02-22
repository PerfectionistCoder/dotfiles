{ lib, ... }@args:
let
  utils = import ../utils { inherit lib; };

  inherit (builtins) baseNameOf;
  name = baseNameOf ./.;
in
utils.mkContainer {
  inherit name args;
  traits = [
    "user"
  ];
  config = {
    extra.addressPrefix = "192.168.53";

    config =
      { pkgs, ... }:
      {
        environment.systemPackages = [ pkgs.hickory-dns ];

        networking.firewall.enable = false;
      };
  };
}
