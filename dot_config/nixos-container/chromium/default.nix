{ ... }@args:
let
  mkContainer = import ../utils args;

  name = baseNameOf ./.;
in
mkContainer {
  inherit name args;

  traits = [
    "browser-fonts"
    "cursor"
    "graphics"
    "pulseaudio"
    "user"
    "wayland"
  ];

  config =
    {
      lib,
      env,
      var,
      ...
    }:
    let
      inherit (lib) bindMountSuffix;
    in
    {
      bindMounts =
        {
          "${var.home}/.config/chromium" = {
            hostPath = "${var.containerMountDir}/${name}";
            isReadOnly = false;
          };
        }
        // bindMountSuffix {
          hostPath = "${var.containerConfigDir}/${name}";
          mountPath = "/etc/chromium/policies/managed";
          suffix = "extra.json";
          isReadOnly = false;
        }
        // bindMountSuffix {
          hostPath = "${env.HOME}";
          mountPath = "${var.home}";
          suffix = "Downloads";
          isReadOnly = false;
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
