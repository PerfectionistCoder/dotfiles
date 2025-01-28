{ env, ... }:
let
  socket = "/tmp/pulsesocket";
in
{
  bindMounts = {
    pulse = {
      hostPath = "${env.xdgRuntimeDir}/pulse/native";
      mountPoint = socket;
    };
  };
  config = {
    environment.sessionVariables = {
      PULSE_SERVER = socket;
    };
  };
}
