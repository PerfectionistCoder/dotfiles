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
        privateNetwork = true;
        hostAddress = "192.168.100.10";
        localAddress = "192.168.100.11";

        bindMounts =
          let
            firefoxConfigDir = "${env.homeDir.host}/.config/firefox";
            firefoxStateDir = "${env.homeDir.host}/.local/state/firefox";
            firefoxDir = "${env.homeDir.local}/.mozilla/firefox";
          in
          with myLib;
          {
            policies = bindMountFile {
              hostPath = firefoxConfigDir;
              mountPath = "/etc/firefox/policies";
              fileName = "policies.json";
            };
            userjs = bindMountFile {
              hostPath = firefoxConfigDir;
              mountPath = "${firefoxDir}/${env.firefoxProfileName}";
              fileName = "user.js";
            };
            profiles = bindMountFile {
              hostPath = firefoxConfigDir;
              mountPath = "${firefoxDir}";
              fileName = "profiles.ini";
            };
            extensions = {
              hostPath = "${firefoxStateDir}/extensions";
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
