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
            firefoxDir = {
              host = "${env.homeDir.host}/.local/share/firefox";
              local = "${env.homeDir.local}/.mozilla/firefox";
            };
          in
          with myLib;
          {
            policies = bindMountFile {
              hostPath = firefoxDir.host;
              mountPath = "/etc/firefox/policies";
              fileName = "policies.json";
            };
            userjs = bindMountFile {
              hostPath = firefoxDir.host;
              mountPath = "${firefoxDir.local}/${env.firefoxProfileName}";
              fileName = "user.js";
            };
            profiles = bindMountFile {
              hostPath = firefoxDir.host;
              mountPath = "${firefoxDir.local}";
              fileName = "profiles.ini";
            };
            extensions = {
              hostPath = "${firefoxDir.host}/extensions";
              mountPoint = "${firefoxDir.local}/${env.firefoxProfileName}/extensions";
              isReadOnly = false;
            };
            firefox = {
              hostPath = "${env.runtimeDir}/firefox";
              mountPoint = "${firefoxDir.local}/${env.firefoxProfileName}";
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
