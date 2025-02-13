{ lib, ... }@args:
let
  myLib = import ./lib.nix;
  variables = import ./variables.nix;

  inherit (lib) mkMerge foldl;
  inherit (myLib) pathToImportAttr bindMountFile;

  firefoxDir = "${variables.homeDir.local}/.mozilla/firefox";
in
{
  containers.firefox-0 = mkMerge (
    pathToImportAttr [
      ./traits/basic-user.nix
      ./traits/wayland.nix
      ./traits/pulseaudio.nix
      ./traits/cursor.nix
      {
        privateNetwork = true;
        hostAddress = "192.168.100.10";
        localAddress = "192.168.100.11";

        bindMounts = {
          test = {
            hostPath = "${variables.persistSession}/0";
            mountPoint = firefoxDir;
            isReadOnly = false;
          };
        };

        config =
          { pkgs, ... }:
          {
            environment.sessionVariables = {
              MOZ_ENABLE_WAYLAND = "1";
            };
            programs.firefox = {
              enable = true;
              package = pkgs.firefox-esr;
              policies =
                (builtins.fromJSON (builtins.readFile ./firefox-policies/base.json))
                // (builtins.fromJSON (builtins.readFile ./firefox-policies/private.json));
            };
          };
      }
    ] ({ inherit variables; } // args)
  );
}
