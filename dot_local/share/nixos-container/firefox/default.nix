{ lib, ... }@args:
let
  utils = import ../utils { inherit lib; };

  inherit (utils)
    traits
    bindMountFile
    variables
    mkContainer
    ;

  name = baseNameOf ./.;
  profileDir = "${variables.homeDir.local}/.mozilla/firefox";
  containerDir = "${variables.containerConfigDir}/firefox";
in
mkContainer {
  inherit name args;

  traits = [
    "user"
    "wayland"
    "pulseaudio"
    # "cursor"
    "fonts"
  ];
  config = {
    extra.addressPrefix = "192.168.0";
    extraFlags = [ "--resolv-conf=bind-uplink" ];

    bindMounts = {
      policies = bindMountFile {
        hostPath = containerDir;
        mountPath = "/etc/firefox/policies";
        fileName = "policies.json";
      };
      profile = bindMountFile {
        hostPath = containerDir;
        mountPath = profileDir;
        fileName = "profiles.ini";
      };
      userjs = bindMountFile {
        hostPath = containerDir;
        mountPath = "${profileDir}/default";
        fileName = "user.js";
      };
      root = {
        hostPath = "${variables.containerVolumeDir}/${name}";
        mountPoint = "${profileDir}/default";
        isReadOnly = false;
      };
      downloads = {
        hostPath = "${variables.homeDir.host}/Downloads";
        mountPoint = "${variables.homeDir.local}/Downloads";
        isReadOnly = false;
      };
    };

    config =
      { pkgs, ... }:
      {
        environment = {
          sessionVariables = {
            MOZ_CRASHREPORTER_DISABLE = "1";
            MOZ_ENABLE_WAYLAND = "1";
          };
          systemPackages = [ pkgs.firefox-esr ];
        };
      };
  };
}
