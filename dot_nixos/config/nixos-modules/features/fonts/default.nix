{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      nerd-fonts.caskaydia-mono
    ];
  };
}
