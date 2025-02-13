{ ... }:
{
  config =
    { pkgs, ... }:
    {
      environment.sessionVariables = {
        MOZ_ENABLE_WAYLAND = "1";
      };
      environment.systemPackages = with pkgs; [ firefox-esr ];
    };
}
