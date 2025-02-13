{ lib, ... }@args:
let
  myLib = import ./lib.nix;
  variables = import ./variables.nix;

  inherit (lib) mkMerge foldl;
  inherit (myLib) pathToImportAttr bindMountFile;

  configDir = "${variables.homeDir.host}/.config/firefox";
  firefoxDir = "${variables.homeDir.local}/.mozilla/firefox";
in
{
  containers.firefox = mkMerge (
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
          policies = bindMountFile {
            hostPath = configDir;
            mountPath = "/etc/firefox/policies";
            fileName = "policies.json";
          };
          profiles = bindMountFile {
            hostPath = configDir;
            mountPath = firefoxDir;
            fileName = "profiles.ini";
          };
          test = {
            hostPath = variables.persistSession;
            mountPoint = "${firefoxDir}/private";
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
    ] ({ inherit variables; } // args)
  );
}
