{ config, pkgs, ... }@args:
{
  imports = [ /etc/nixos/hardware-configuration.nix ];

  system = { inherit ((import /etc/nixos/configuration.nix args).system) stateVersion; };
}
