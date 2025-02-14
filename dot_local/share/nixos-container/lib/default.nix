{ lib, ... }:
let
  inherit (builtins) typeOf readDir;
  inherit (lib) mapAttrs' removeSuffix;
in
{
  pathToImportAttr =
    list: args:
    map (
      x:
      let
        attr = if typeOf x == "path" then (import x) else x;
      in
      if typeOf attr == "lambda" then (attr args) else attr
    ) list;
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
  traits = mapAttrs' (name: _: {
    name = removeSuffix ".nix" name;
    value = import ./traits/${name};
  }) (readDir ./traits);
  variables = import ./variables.nix;
}
