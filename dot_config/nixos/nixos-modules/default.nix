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
    ++ lib.modulesMkOption {
      inherit config args;
      path = ./features;
    };
  system.stateVersion = (import /etc/nixos/configuration.nix args).system.stateVersion;

  nixpkgs.overlays = import inputs.nixpkgs-overlays;

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = lib.mkDefault 1;
    };
    tmp.cleanOnBoot = true;
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    nixPath = [
      "nixpkgs=/etc/nix/inputs/nixpkgs"
      "nixpkgs-overlays=/etc/nix/inputs/nixpkgs-overlays"
    ];
    channel.enable = false;
  };
  environment.etc = {
    "nix/inputs/nixpkgs".source = "${inputs.nixpkgs}";
    "nix/inputs/nixpkgs-overlays".source = "${inputs.nixpkgs-overlays}";
  };

  time.timeZone = "Europe/London";
  i18n = {
    defaultLocale = "en_GB.UTF-8";
    supportedLocales = [ "en_GB.UTF-8/UTF-8" ];
    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };
}
