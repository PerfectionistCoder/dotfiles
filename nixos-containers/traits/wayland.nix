{ env, ... }:
let
  socket = "/tmp/wayland";
in
{
  bindMounts = {
    wayland = {
      hostPath = "${env.xdgRuntimeDir}/wayland-1";
      mountPoint = socket;
    };
  };
  config = {
    environment.sessionVariables = {
      WAYLAND_DISPLAY = socket;
    };
  };
}
