{ ... }@args:
let
  mkContainer = import ../utils args;

  name = baseNameOf ./.;
in
mkContainer {
  inherit name args;

  traits = [
    "font"
    "user"
    "wayland"
    "pulseaudio"
    "graphics"
    # "cursor"
  ];
  config =
    { lib, variables, ... }:
    let
      inherit (lib) bindMountSuffix;

      containerDir = "${variables.containerConfigDir}/${name}";
      qutebrowserDir = "${variables.homeDir.local}/.config/qutebrowser";
    in
    {
      bindMounts = {
        config = bindMountSuffix {
          hostPath = containerDir;
          mountPath = qutebrowserDir;
          suffix = "config.py";
        };
        bindings = bindMountSuffix {
          hostPath = containerDir;
          mountPath = qutebrowserDir;
          suffix = "bindings.py";
        };
      };

      extra.addressPrefix = "192.168.1";
      config =
        { pkgs, ... }:
        {
          networking = {
            useHostResolvConf = false;
            nameservers = [
              "194.242.2.9#all.dns.mullvad.net"
            ];
          };
          services.resolved = {
            enable = true;
            domains = [ "~." ];
            dnsovertls = "true";
          };

          environment = {
            systemPackages = [ pkgs.qutebrowser ];
          };
        };
    };
}
