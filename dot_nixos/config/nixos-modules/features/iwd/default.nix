{ ... }:
{
  networking = {
    wireless.iwd.enable = true;
    dhcpcd.wait = "background";
  };
}
