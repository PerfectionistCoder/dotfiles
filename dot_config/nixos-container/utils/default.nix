{ ... }@args:
let
  lib = args.lib.extend (import ./lib);

  inherit (builtins) typeOf readDir;
  inherit (lib)
    mapAttrs'
    removeSuffix
    mkMerge
    mkDefault
    optionalAttrs
    ;

  concatConfig =
    list: args:
    map (
      config:
      let
        attr = if typeOf config == "path" then (import config) else config;
      in
      if typeOf attr == "lambda" then
        (attr (
          args
          // {
            inherit lib env var;
          }
        ))
      else
        attr
    ) list;
  importTraits = mapAttrs' (name: _: {
    name = removeSuffix ".nix" name;
    value = import ./traits/${name};
  }) (readDir ./traits);

  env = import ./env.nix;
  var = import ./var.nix env;
in
{
  name,
  traits ? [ ],
  config ? { },
  args,
}:
{
  containers.${name} = mkMerge (
    concatConfig (
      (map (trait: importTraits.${trait}) traits)
      ++ [
        config
        {
          ephemeral = mkDefault true;
          config =
            { modulesPath, ... }:
            {
              imports = [ "${modulesPath}/profiles/minimal.nix" ];

              nixpkgs.overlays = import <nixpkgs-overlays>;
            };
        }
      ]
    ) args
  );
}
