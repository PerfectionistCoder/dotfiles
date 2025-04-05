{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      custom.fonts.monospace
    ];
  };
}
