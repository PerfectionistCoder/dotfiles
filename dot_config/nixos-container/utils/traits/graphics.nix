{ lib, ... }:
let
  inherit (lib) bindMountClone;
in
{
  bindMounts =
    bindMountClone {
      path = "/dev/dri";
    }
    // bindMountClone {
      path = "/run/opengl-driver";
    };

  allowedDevices = [
    {
      modifier = "rw";
      node = "/dev/dri/renderD128";
    }
  ];
}
