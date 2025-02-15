{ lib, ... }@args:
let
  myLib = import ../lib { inherit lib; };

  inherit (lib) mkMerge foldl;
  inherit (myLib) pathToImportAttr variables;
in
{
  name,
  policies ? [ ],
  extraConfig,
  ...
}:
{
  containers.${name} = mkMerge (
    pathToImportAttr [
      myLib.traits.user
      myLib.traits.wayland
      myLib.traits.pulseaudio
      myLib.traits.cursor
      {
        privateNetwork = true;

        bindMounts = {
          dir = {
            hostPath = "${variables.persistSession}/${name}";
            mountPoint = "${variables.homeDir.local}/.mozilla/firefox";
            isReadOnly = false;
          };
        };

        config =
          { pkgs, ... }:
          {
            environment.sessionVariables = {
              MOZ_ENABLE_WAYLAND = "1";
            };
            programs.firefox = {
              enable = true;
              package = pkgs.firefox-esr;
              policies = foldl (attr: name: attr // (import ./policies/${name}.nix)) { } policies;
            };
          };
      }
      extraConfig
    ] ({ inherit variables; } // args)
  );
}
