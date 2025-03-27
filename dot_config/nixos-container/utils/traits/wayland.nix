{ env, ... }:
let
  socket = "/tmp/wayland";
in
{
  bindMounts = {
    wayland = {
      hostPath = "${env.XDG_RUNTIME_DIR}/${env.WAYLAND_DISPLAY}";
      mountPoint = socket;
    };
  };
  config = {
    environment.sessionVariables = {
      inherit (env) DISPLAY;
      WAYLAND_DISPLAY = socket;
    };
  };
}
