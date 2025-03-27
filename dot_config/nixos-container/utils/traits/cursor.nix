{
  lib,
  env,
  var,
  ...
}:
{
  bindMounts = lib.bindMountSuffix {
    hostPath = env.HOME;
    mountPoint = var.home;
    suffix = ".icons"
  };
}
