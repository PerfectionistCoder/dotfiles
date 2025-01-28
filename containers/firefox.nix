{ lib, ... }@args:
let
  myLib = import ./lib.nix;
  env = import ./env.nix;
in
{
  containers.firefox = lib.mkMerge (
    myLib.pathToImportAttr [
      ./traits/basic-user.nix
      ./traits/wayland.nix
      ./traits/pulseaudio.nix
      ./traits/cursor.nix
      {
        config =
          { pkgs, ... }:
          {
            environment.sessionVariables = {
              MOZ_ENABLE_WAYLAND = "1";
            };
            environment.systemPackages = with pkgs; [ firefox ];
          };
      }
    ] ({ inherit env; } // args)
  );
}
