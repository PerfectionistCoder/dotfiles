{ lib, ... }@args:
let
  utils = import ../utils { inherit lib; };

  inherit (builtins) elemAt;
  inherit (lib)
    mkMerge
    foldl
    optionalAttrs
    splitString
    removePrefix
    ;
  inherit (utils)
    traits
    pathToImportAttr
    bindMountFile
    variables
    mkContainer
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
mkContainer {
  inherit name args;
  traits = [
    "user"
    "wayland"
    "pulseaudio"
    # "cursor"
    "fonts"
  ];
  config = {
    bindMounts = {
      profile = bindMountFile {
        hostPath = "${variables.containerConfigDir}/firefox";
        mountPath = profileDir;
        fileName = "profiles.ini";
      };
      userjs = bindMountFile {
        hostPath = "${variables.containerConfigDir}/firefox";
        mountPath = "${profileDir}/default";
        fileName = "user.js";
      };
      root = {
        hostPath = "${variables.containerVolumeDir}/${name}";
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
        programs.firefox =
          let
            bookmarkList = foldl (list: name: list ++ (import ./bookmarks/${name}.nix)) [ ] bookmarks;
          in
          {
            enable = true;
            package = pkgs.firefox-esr;
            policies = foldl (attr: name: attr // (import ./policies/${name}.nix)) {
              Bookmarks = bookmarkList;
              WebsiteFilter = optionalAttrs visitBookmarksOnly {
                Block = [ "<all_urls>" ];
                Exceptions = map (
                  bookmark:
                  let
                    url = bookmark.URL;
                  in
                  "https://" + (elemAt (splitString "/" (removePrefix "https://" url)) 0) + "/*"
                ) bookmarkList;
              };
            } ([ "base" ] ++ policies);
            preferences = {
              "browser.theme.content-theme" = 0;
              "browser.theme.toolbar-theme" = 0;
            };
          };
      };
  } // extraConfig;
}
