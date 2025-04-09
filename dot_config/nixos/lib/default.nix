final: prev:
let
  inherit (builtins) attrNames readDir removeAttrs;
  inherit (final)
    entryFullNames
    entryPaths
    mkIf
    mkOption
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

  mkFeatures =
    {
      config,
      path,
      args,
      default ? false,
    }:
    (map (
      path:
      let
        name = (baseNameOf path);
        module = (import path args);
      in
      {
        options = {
          features.${name} = {
            enable = mkOption {
              inherit default;
            };
          } // (module.options or { });
        };
        config = mkIf config.features.${name}.enable (removeAttrs module [ "options" ]);
      }
    ) (entryPaths path));
}
