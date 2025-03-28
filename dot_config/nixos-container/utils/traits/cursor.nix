{
  lib,
  env,
  var,
  ...
}:
{
  bindMounts = lib.bindMountSuffix {
    hostPath = env.HOME;
    mountPath = var.home;
    suffix = ".local/share/icons";
  };
}
