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
        bindMounts =
          let
            firefoxCfg = "${env.homeDir.host}/containers/firefox";
          in
          {
            policies = {
              hostPath = "${firefoxCfg}/policies.json";
              mountPoint = "/etc/firefox/policies/policies.json";
            };
          };

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
