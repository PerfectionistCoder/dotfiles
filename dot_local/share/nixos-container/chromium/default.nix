{ lib, ... }@args:
let
  utils = import ../utils { inherit lib; };

  inherit (utils)
    mkContainer
    ;

  name = baseNameOf ./.;
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
    config =
      { pkgs, ... }:
      {
        environment = {
          sessionVariables = {
            NIXOS_OZONE_WL = "1";
          };
          systemPackages = [
            (pkgs.ungoogled-chromium.override {
              commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
            })
          ];
        };
      };
  };
}
