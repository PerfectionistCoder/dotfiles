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
    # "cursor"
  ];
  config =
    { lib, variables, ... }:
    let
      inherit (lib) bindMountSuffix bindMountClone;

      profileDir = "${variables.homeDir.local}/.mozilla/firefox";
      containerDir = "${variables.containerConfigDir}/firefox";
    in
    {
      bindMounts = {
        policies = bindMountSuffix {
          hostPath = containerDir;
          mountPath = "/etc/firefox/policies";
          suffix = "policies.json";
        };
        profile = bindMountSuffix {
          hostPath = containerDir;
          mountPath = profileDir;
          suffix = "profiles.ini";
        };
        userjs = bindMountSuffix {
          hostPath = containerDir;
          mountPath = "${profileDir}/default";
          suffix = "user.js";
        };
        "${profileDir}/default" = {
          hostPath = "${variables.containerMountDir}/${name}";
          isReadOnly = false;
        };
        downloads = bindMountSuffix {
          hostPath = "${variables.homeDir.host}";
          mountPath = "${variables.homeDir.local}";
          suffix = "Downloads";
          isReadOnly = false;
        };
      };

      extra.addressPrefix = "192.168.0";
      config =
        { pkgs, ... }:
        {
          networking.useHostResolvConf = false;
          services.resolved = {
            enable = true;
            domains = [ "~." ];
          };

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
