{ lib, ... }@args:
let
  myLib = import ./lib.nix;
  env = import ./tmpl-env.nix;
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
            firefoxDir = "${env.homeDir.host}/.local/share/firefox";
          in
          with myLib;
          {
            policies = bindMountFile {
              hostPath = firefoxDir;
              mountPath = "/etc/firefox/policies";
              fileName = "policies.json";
            };
            # firefox = {
            #   hostPath = "${firefoxDir}/firefox";
            #   mountPoint = "${env.homeDir.local}/.mozilla/firefox";
            #   isReadOnly = false;
            # };
          };

        config =
          { pkgs, ... }:
          {
            environment.sessionVariables = {
              MOZ_ENABLE_WAYLAND = "1";
            };
            environment.systemPackages = with pkgs; [ firefox-esr ];
          };
      }
    ] ({ inherit env; } // args)
  );
}
