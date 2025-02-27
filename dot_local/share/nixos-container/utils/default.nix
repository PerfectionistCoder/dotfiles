{ lib, ... }:
let
  inherit (builtins) typeOf readDir;
  inherit (lib)
    mapAttrs'
    removeSuffix
    mkMerge
    mkDefault
    ;
  variables = import ./variables.nix;
in
{
  inherit variables;

  mkContainer =
    let
      concatConfig =
        list: args:
        map (
          x:
          let
            attr = if typeOf x == "path" then (import x) else x;
          in
          if typeOf attr == "lambda" then (attr ({ inherit variables; } // args)) else attr
        ) list;
      importTraits = mapAttrs' (name: _: {
        name = removeSuffix ".nix" name;
        value = import ./traits/${name};
      }) (readDir ./traits);
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
              config =
                { modulesPath, ... }:
                {
                  imports = [ "${modulesPath}/profiles/minimal.nix" ];
                };
            }
          ]
        ) args
      );
    };
  bindMountFile =
    {
      hostPath,
      mountPath,
      fileName,
    }:
    {
      hostPath = "${hostPath}/${fileName}";
      mountPoint = "${mountPath}/${fileName}";
    };
}
