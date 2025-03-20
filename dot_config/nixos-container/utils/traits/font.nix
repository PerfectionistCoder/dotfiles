{
  config =
    { pkgs, ... }:
    {
      fonts = {
        packages = with pkgs; [
          noto-fonts-cjk-sans
          noto-fonts-color-emoji
          custom.fonts.monospace
        ];
        fontconfig.defaultFonts = {
          serif = [
            "Noto Sans CJK HK"
          ];
          sansSerif = [
            "Noto Sans CJK HK"
          ];
        };
      };
    };
}
