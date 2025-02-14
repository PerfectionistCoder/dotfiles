{ variables, ... }:
let
  socket = "/tmp/wayland";
in
{
  bindMounts = {
    wayland = {
      hostPath = "${variables.xdgRuntimeDir}/wayland-1";
      mountPoint = socket;
    };
  };
  config = {
    environment.sessionVariables = {
      WAYLAND_DISPLAY = socket;
    };
  };
}
