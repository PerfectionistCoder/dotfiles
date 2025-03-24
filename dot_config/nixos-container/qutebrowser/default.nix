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
      bindMounts =
        {
          "${qutebrowserDir}" = {
            hostPath = "${containerDir}/config";
            isReadOnly = false;
          };
        }
        // bindMountSuffix {
          hostPath = variables.homeDir.host;
          mountPath = variables.homeDir.local;
          suffix = "Downloads";
          isReadOnly = false;
        };

      extra.addressPrefix = "10.255.0";
      config =
        { pkgs, ... }:
        {
          networking = {
            useHostResolvConf = false;
            nameservers = [
              "194.242.2.2#dns.mullvad.net"
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

          fonts.packages = with pkgs; [
            noto-fonts-cjk-sans
            noto-fonts-color-emoji
            custom.fonts.monospace
          ];
        };
    };
}
