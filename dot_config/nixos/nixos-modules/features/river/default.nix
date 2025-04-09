{ ... }:
{
  programs.river = {
    enable = true;
    extraPackages = [ ];
    xwayland.enable = false;
  };
}
