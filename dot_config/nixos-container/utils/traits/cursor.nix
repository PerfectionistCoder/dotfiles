{
  lib,
  env,
  var,
  ...
}:
{
  bindMounts = lib.bindMountSuffix {
    hostPath = "${env.HOME}/.nix-profile";
    mountPath = "${var.home}/.local";
    suffix = "share";
  };
}
