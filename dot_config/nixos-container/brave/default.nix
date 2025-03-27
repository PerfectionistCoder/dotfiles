{ ... }@args:
let
  mkContainer = import ../utils args;

  name = baseNameOf ./.;
in
mkContainer {
  inherit name args;

  traits = [
    "browser-fonts"
    "pulseaudio"
    "user"
    "wayland"
    # "cursor"
  ];

  config =
    { lib, variables, ... }:
    let
      inherit (lib) bindMountSuffix;
    in
    {
      bindMounts =
        {
          "${variables.homeDir.local}/.config/BraveSoftware/Brave-Browser" = {
            hostPath = "${variables.containerMountDir}/${name}";
            isReadOnly = false;
          };
        }
        // bindMountSuffix {
          hostPath = "${variables.containerConfigDir}/${name}";
          mountPath = "/etc/brave/policies/managed";
          suffix = "extra.json";
          isReadOnly = false;
        }
        // bindMountSuffix {
          hostPath = "${variables.homeDir.host}";
          mountPath = "${variables.homeDir.local}";
          suffix = "Downloads";
          isReadOnly = false;
        };

      config =
        { pkgs, ... }:
        {
          environment.systemPackages = [
            pkgs.brave
          ];
        };
    };

  entrypoint = ''
    brave --force-dark-mode
  '';
}
