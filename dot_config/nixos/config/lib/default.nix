final: prev:
let
  inherit (builtins) attrNames readDir;
  inherit (final)
    mkIf
    mkOption
    entryNames
    entryPaths
    wrapMkOption
    ;
in
{
  entryNames = path: attrNames (readDir path);
  entryPaths = path: map (name: path + "/${name}") (entryNames path);
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
