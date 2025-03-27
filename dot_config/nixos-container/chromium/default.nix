{ ... }@args:
let
  mkContainer = import ../utils args;

  name = baseNameOf ./.;
in
mkContainer {
  inherit name args;

  traits = [
    "browser-fonts"
    "graphics"
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
          "${variables.homeDir.local}/.config/chromium" = {
            hostPath = "${variables.containerMountDir}/${name}";
            isReadOnly = false;
          };
        }
        // bindMountSuffix {
          hostPath = "${variables.containerConfigDir}/${name}";
          mountPath = "/etc/chromium/policies/managed";
          suffix = "extra.json";
        };

      config =
        { pkgs, ... }:
        {
          environment.systemPackages = [
            pkgs.ungoogled-chromium
          ];
        };
    };

  entrypoint = ''
    chromium --force-dark-mode --extension-mime-request-handling=always-prompt-for-install
  '';
}
