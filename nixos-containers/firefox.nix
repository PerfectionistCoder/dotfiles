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
              mountPath = "${firefoxDir.local}/${env.firefox.profileName}";
              fileName = "user.js";
            };
            profiles = bindMountFile {
              hostPath = firefoxDir.host;
              mountPath = "${firefoxDir.local}";
              fileName = "profiles.ini";
            };
            extensions = {
              hostPath = "${firefoxDir.host}/extensions";
              mountPoint = "${firefoxDir.local}/${env.firefox.profileName}/extensions";
              isReadOnly = false;
            };
            firefox = {
              hostPath = "${env.firefox.mountPath}/${env.firefox.profileName}";
              mountPoint = "${firefoxDir.local}/${env.firefox.profileName}";
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
