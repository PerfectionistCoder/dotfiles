final: prev:
let
  inherit (builtins) attrNames readDir removeAttrs;
  inherit (final)
    entryFullNames
    entryPaths
    mkIf
    mkOption
    wrapModule
    removeSuffix
    filterAttrs
    ;
in
{
  fileNames =
    path:
    map (name: removeSuffix ".nix" name) (
      attrNames (filterAttrs (_: value: value == "regular") (readDir path))
    );
  entryFullNames = path: attrNames (readDir path);
  entryPaths = path: map (name: path + "/${name}") (entryFullNames path);

  wrapModule =
    {
      config,
      name,
      module,
    }:
    {
      options = {
        features.${name} = {
          enable = mkOption {
            default = false;
          };
        } // (module.options or { });
      };
      config = mkIf config.features.${name}.enable (removeAttrs module [ "options" ]);
    };
  mkFeature =
    {
      config,
      path,
      args,
    }:
    (map (
      path:
      wrapModule {
        inherit config;
        name = (baseNameOf path);
        module = (import path args);
      }
    ) (entryPaths path));
}
