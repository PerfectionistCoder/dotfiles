{ lib, ... }:
let
  inherit (lib) bindMountClone;
in
{
  bindMounts = {
    dri = bindMountClone {
      path = "/dev/dri";
    };
    opengl = bindMountClone {
      path = "/run/opengl-driver";
    };
  };

  allowedDevices = [
    {
      modifier = "rw";
      node = "/dev/dri/renderD128";
    }
  ];
}
