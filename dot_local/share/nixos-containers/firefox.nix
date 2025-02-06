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
            firefoxConfig = "${env.homeDir.host}/.config/firefox";
            firefoxData = "${env.homeDir.host}/.local/share/firefox";
            firefoxDir = "${env.homeDir.local}/.mozilla/firefox";
          in
          with myLib;
          {
            policies = bindMountFile {
              hostPath = firefoxConfig;
              mountPath = "/etc/firefox/policies";
              fileName = "policies.json";
            };
            userjs = bindMountFile {
              hostPath = firefoxConfig;
              mountPath = "${firefoxDir}/${env.firefoxProfileName}";
              fileName = "user.js";
            };
            profiles = bindMountFile {
              hostPath = firefoxConfig;
              mountPath = "${firefoxDir}";
              fileName = "profiles.ini";
            };
            extensions = {
              hostPath = "${firefoxData}/extensions";
              mountPoint = "${firefoxDir}/${env.firefoxProfileName}/extensions";
              isReadOnly = false;
            };
            firefox = {
              hostPath = "${env.sessionDir}/firefox";
              mountPoint = "${firefoxDir}/${env.firefoxProfileName}";
              isReadOnly = false;
            };
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
