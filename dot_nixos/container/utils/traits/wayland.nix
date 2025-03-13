{ variables, ... }:
let
  socket = "/tmp/wayland";
in
{
  bindMounts = {
    wayland = {
      hostPath = "${variables.xdgRuntimeDir}/${variables.waylandDisplay}";
      mountPoint = socket;
    };
  };
  config = {
    environment.sessionVariables = {
      WAYLAND_DISPLAY = socket;
    };
  };
}
