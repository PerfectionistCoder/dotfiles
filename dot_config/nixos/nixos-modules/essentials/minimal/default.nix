{ lib, ... }:
let
  inherit (lib) mkDefault;
in
{
  environment = {
    defaultPackages = mkDefault [ ];
    stub-ld.enable = mkDefault false;
  };

  programs = {
    less.lessopen = mkDefault null;
    command-not-found.enable = mkDefault false;
  };
}
