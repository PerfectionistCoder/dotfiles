{
  config =
    { pkgs, ... }:
    {
      fonts = {
        packages = with pkgs; [
          noto-fonts-cjk-sans
          selfDefinePkgs.fonts.monospace
        ];
      };
    };
}
