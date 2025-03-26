{
  config,
  lib,
  pkgs,
  inputs,
  ...
}@args:
{
  imports =
    lib.mkFeature {
      inherit config args;
      path = ./features;
    }
    ++ lib.entryPaths ./essentials;

  nixpkgs.overlays = import inputs.nixpkgs-overlays;
}
