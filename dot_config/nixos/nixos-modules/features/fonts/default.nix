{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      pkgs.custom.fonts.monospace
    ];
  };
}
