{
  config =
    { pkgs, ... }:
    {
      fonts = {
        packages = with pkgs; [
          noto-fonts-cjk-sans
          fira
          noto-fonts-color-emoji
        ];
        fontconfig.defaultFonts = {
          serif = [
            "Fira Sans"
            "Noto Sans CJK HK"
          ];
          sansSerif = [
            "Fira Sans"
            "Noto Sans CJK HK"
          ];
          monospace = [ "Fira Mono" ];
        };
      };
    };
}
