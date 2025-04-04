{ env, ... }:
let
  socket = "/tmp/wayland";
in
{
  bindMounts = {
    ${socket} = {
      hostPath = "${env.XDG_RUNTIME_DIR}/${env.WAYLAND_DISPLAY}";
    };
  };
  config = {
    environment.sessionVariables = {
      inherit (env) DISPLAY;
      WAYLAND_DISPLAY = socket;
    };
  };
}
