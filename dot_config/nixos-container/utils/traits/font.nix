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
        fontconfig.defaultFonts =
          let
            list = [
              "DejaVu Sans"
              "Noto Sans CJK HK"
            ];
          in
          {
            serif = list;
            sansSerif = list;
          };
      };
    };
}
