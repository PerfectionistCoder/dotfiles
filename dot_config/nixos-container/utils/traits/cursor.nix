{
  lib,
  env,
  var,
  ...
}:
let
  inherit (lib) bindMountSuffix;
in
{
  bindMounts = bindMountSuffix {
    hostPath = "${env.HOME}/.nix-profile";
    mountPath = "${var.home}/.local";
    suffix = "share/icons";
  };
}
