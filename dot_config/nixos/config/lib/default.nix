final: prev:
let
  inherit (builtins) attrNames readDir;
  inherit (final)
    entryFullNames
    entryPaths
    mkIf
    mkOption
    wrapMkOption
    removeSuffix
    ;
in
{
  entryNames = path: map (name: removeSuffix ".nix" name) (entryFullNames path);
  entryFullNames = path: attrNames (readDir path);
  entryPaths = path: map (name: path + "/${name}") (entryFullNames path);
  wrapMkOption =
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
      config = mkIf config.features.${name}.enable (module.config or module);
    };
  modulesMkOption =
    {
      config,
      path,
      args,
    }:
    (map (
      path:
      wrapMkOption {
        inherit config;
        name = (baseNameOf path);
        module = (import path args);
      }
    ) (entryPaths path));
}
