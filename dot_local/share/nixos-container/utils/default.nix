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
      minimalConfig = {
        documentation = {
          enable = mkDefault false;
          doc.enable = mkDefault false;
          info.enable = mkDefault false;
          man.enable = mkDefault false;
          nixos.enable = mkDefault false;
        };
        environment = {
          defaultPackages = mkDefault [ ];
          stub-ld.enable = mkDefault false;
        };
        programs = {
          less.lessopen = mkDefault null;
          command-not-found.enable = mkDefault false;
        };
        boot.enableContainers = mkDefault false;
        services = {
          logrotate.enable = mkDefault false;
          udisks2.enable = mkDefault false;
        };
        xdg = {
          autostart.enable = mkDefault false;
          icons.enable = mkDefault false;
          mime.enable = mkDefault false;
          sounds.enable = mkDefault false;
        };
      };
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
            { config = minimalConfig; }
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
