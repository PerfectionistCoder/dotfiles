{ lib, config, ... }:
{
  services.resolved = {
    enable = true;
    domains = [ "~." ];
    dnsovertls = "true";
  };
}
