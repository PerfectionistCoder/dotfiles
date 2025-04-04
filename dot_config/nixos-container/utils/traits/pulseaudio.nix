{ env, ... }:
let
  socket = "/tmp/pulsesocket";
in
{
  bindMounts = {
    ${socket} = {
      hostPath = "${env.XDG_RUNTIME_DIR}/pulse/native";
    };
  };
  config = {
    environment.sessionVariables = {
      PULSE_SERVER = socket;
    };
  };
}
