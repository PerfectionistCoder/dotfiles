{ variables, ... }:
{
  bindMounts = {
    cursor = {
      hostPath = "${variables.homeDir.host}/.icons";
      mountPoint = "${variables.homeDir.local}/.icons";
    };
  };
}
