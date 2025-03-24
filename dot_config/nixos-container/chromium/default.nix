{ ... }@args:
let
  mkContainer = import ../utils args;

  name = baseNameOf ./.;
in
mkContainer {
  inherit name args;

  traits = [
    "font"
    "graphics"
    "pulseaudio"
    "user"
    "wayland"
    # "cursor"
  ];

  config =
    { lib, variables, ... }:
    let
      inherit (lib) bindMountSuffix bindMountClone;
      configDir = "${variables.homeDir.local}/.config/chromium";
      containerDir = "${variables.containerConfigDir}/chromium";
    in
    {
      bindMounts =
        {
          ${configDir} = {
            hostPath = "${variables.containerMountDir}/${name}";
            isReadOnly = false;
          };
        }
        // bindMountSuffix {
          hostPath = containerDir;
          mountPath = "/etc/chromium/policies/managed";
          suffix = "extra.json";
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
                commandLineArgs = "--ozone-platform=wayland --enable-features=AcceleratedVideoDecodeLinuxGL,AcceleratedVideoEncoder --force-dark-mode --extension-mime-request-handling=always-prompt-for-install";
              })
            ];
          };
        };
    };
}
