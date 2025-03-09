{ ... }@args:
let
  mkContainer = import ../utils args;

  name = baseNameOf ./.;
in
mkContainer {
  inherit name args;

  traits = [
    "user"
    "wayland"
    "pulseaudio"
    "graphics"
    # "cursor"
  ];

  config =
    { lib, variables, ... }:
    let
      inherit (lib) bindMountSuffix bindMountClone;
      containerDir = "${variables.containerConfigDir}/chromium";
    in
    {
      bindMounts = {
        policies = bindMountSuffix {
          hostPath = containerDir;
          mountPath = "/etc/chromium/policies/managed";
          suffix = "extra.json";
        };
        preferences = bindMountSuffix {
          hostPath = containerDir;
          mountPath = "/etc/chromium";
          suffix = "initial_preferences";
        };
      };

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
