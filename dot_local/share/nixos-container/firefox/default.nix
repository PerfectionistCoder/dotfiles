{ lib, ... }@args:
let
  utils = import ../utils { inherit lib; };

  inherit (builtins) elemAt;
  inherit (lib)
    mkMerge
    foldl
    mkIf
    splitString
    removePrefix
    ;
  inherit (utils)
    traits
    pathToImportAttr
    bindMountFile
    variables
    ;

  profileDir = "${variables.homeDir.local}/.mozilla/firefox";
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
      traits.user
      traits.wayland
      traits.pulseaudio
      traits.cursor
      {
        privateNetwork = true;

        bindMounts = {
          profile = bindMountFile {
            hostPath = variables.firefoxData;
            mountPath = profileDir;
            fileName = "profiles.ini";
          };
          userjs = bindMountFile {
            hostPath = variables.firefoxData;
            mountPath = "${profileDir}/default";
            fileName = "user.js";
          };
          root = {
            hostPath = "${variables.containerVolume}/${name}";
            mountPoint = "${profileDir}/default";
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
