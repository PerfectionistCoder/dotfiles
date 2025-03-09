{ lib, ... }@args:
let
  utils = import ../utils { inherit lib; };

  inherit (utils) mkContainer bindMountFile variables;

  name = baseNameOf ./.;
  containerDir = "${variables.containerConfigDir}/chromium";
in
mkContainer {
  inherit name args;

  traits = [
    "user"
    "wayland"
    "pulseaudio"
    # "cursor"
  ];

  config = {
    bindMounts = {
      policies = bindMountFile {
        hostPath = containerDir;
        mountPath = "/etc/chromium/policies/managed";
        fileName = "extra.json";
      };
      preferences = bindMountFile {
        hostPath = containerDir;
        mountPath = "/etc/chromium";
        fileName = "initial_preferences";
      };
      dri = rec {
        hostPath = "/dev/dri";
        mountPoint = hostPath;
      };
      opengl = rec {
        hostPath = "/run/opengl-driver";
        mountPoint = hostPath;
      };
    };

    allowedDevices = [
      {
        modifier = "rw";
        node = "/dev/dri/renderD128";
      }
    ];

    config =
      { pkgs, ... }:
      {
        environment = {
          sessionVariables = {
            NIXOS_OZONE_WL = "1";
          };
          systemPackages = [
            (pkgs.ungoogled-chromium.override {
              commandLineArgs = "--ozone-platform=wayland --enable-features=AcceleratedVideoDecodeLinuxGL,AcceleratedVideoEncoder";
            })
          ];
        };
      };
  };
}
