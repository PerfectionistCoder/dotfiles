{ variables, ... }:
let
  socket = "/tmp/pulsesocket";
in
{
  bindMounts = {
    pulse = {
      hostPath = "${variables.xdgRuntimeDir}/pulse/native";
      mountPoint = socket;
    };
  };
  config = {
    environment.sessionVariables = {
      PULSE_SERVER = socket;
    };
  };
}
