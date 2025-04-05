{
  config,
  lib,
  pkgs,
  inputs,
  ...
}@args:
{
  imports =
    [ /etc/nixos/hardware-configuration.nix ]
    ++ lib.mkFeatures {
      inherit config args;
      path = ./features;
    }
    ++ lib.mkFeatures {
      inherit config args;
      default = true;
      path = ./default-features;
    };

  nixpkgs.overlays = import inputs.nixpkgs-overlays;

  system = { inherit ((import /etc/nixos/configuration.nix args).system) stateVersion; };
}
