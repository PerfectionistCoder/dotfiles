{ config, ... }:
let
  cfg.resolved = config.services.resolved.enable or false;
in
{
  networking.networkmanager = {
    enable = true;
    dns = if cfg.resolved then "default" else "systemd-resolved";
  };
  systemd.services.NetworkManager-wait-online.enable = cfg.resolved;
}
