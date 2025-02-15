{ lib, ... }@args:
let
  myLib = import ../lib { inherit lib; };

  inherit (builtins) elemAt;
  inherit (lib)
    mkMerge
    foldl
    mkIf
    splitString
    removePrefix
    ;
  inherit (myLib) pathToImportAttr variables;
in
{
  name,
  policies ? [ ],
  bookmarks ? [ ],
  visitBookmarksOnly ? false,
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
              policies = foldl (attr: name: attr // (import ./policies/${name}.nix)) {
                Bookmarks = bookmarks;
                WebsiteFilter = mkIf visitBookmarksOnly {
                  Block = [ "<all_urls>" ];
                  Exceptions = map (
                    bookmark:
                    let
                      url = bookmark.URL;
                    in
                    "https://" + (elemAt (splitString "/" (removePrefix "https://" url)) 0) + "/*"
                  ) bookmarks;
                };
              } ([ "common" ] ++ policies);
            };
          };
      }
      extraConfig
    ] ({ inherit variables; } // args)
  );
}
