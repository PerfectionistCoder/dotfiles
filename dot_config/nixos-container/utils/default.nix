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
            inherit variables lib;
          }
        ))
      else
        attr
    ) list;
  importTraits = mapAttrs' (name: _: {
    name = removeSuffix ".nix" name;
    value = import ./traits/${name};
  }) (readDir ./traits);

  variables = import ./variables.nix;
in
{
  name,
  traits ? [ ],
  config ? { },
  entrypoint ? false,
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
        (optionalAttrs (entrypoint != false) {
          config =
            { pkgs, ... }:
            {
              environment.systemPackages = [
                (pkgs.writeShellScriptBin "entrypoint" entrypoint)
              ];
            };
        })
      ]
    ) args
  );
}
