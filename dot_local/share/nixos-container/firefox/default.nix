{ lib, ... }@args:
let
  myLib = import ../lib { inherit lib; };

  inherit (builtins) listToAttrs;
  inherit (lib) mkMerge foldl;
  inherit (myLib) pathToImportAttr bindMountFile variables;

  firefoxDir = "${variables.homeDir.local}/.mozilla/firefox";
in
{
  containers = listToAttrs (
    map
      (profile: {
        name = "fx-${profile.name}";
        value = mkMerge (
          pathToImportAttr [
            myLib.traits.user
            myLib.traits.wayland
            myLib.traits.pulseaudio
            myLib.traits.cursor
            {
              privateNetwork = true;

              bindMounts = {
                dir = {
                  hostPath = "${variables.persistSession}/firefox/${profile.name}";
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
                  };
                };
            }
            profile.extraConfig
          ] ({ inherit variables; } // args)
        );
      })
      [
        {
          name = "private";
          extraConfig = {
            hostAddress = "192.168.100.10";
            localAddress = "192.168.100.11";

            config.programs.firefox.policies = import ./base.nix // (import ./private.nix);
          };
        }
      ]
  );
}
