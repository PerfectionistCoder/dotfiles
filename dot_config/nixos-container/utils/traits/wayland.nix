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
      DISPLAY = ":0";
      WAYLAND_DISPLAY = socket;
    };
  };
}
