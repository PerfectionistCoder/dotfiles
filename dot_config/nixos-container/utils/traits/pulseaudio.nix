{ env, ... }:
let
  socket = "/tmp/pulsesocket";
in
{
  bindMounts = {
    pulse = {
      hostPath = "${env.XDG_RUNTIME_DIR}/pulse/native";
      mountPoint = socket;
    };
  };
  config = {
    environment.sessionVariables = {
      PULSE_SERVER = socket;
    };
  };
}
