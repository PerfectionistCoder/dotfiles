{ env, ... }:
{
  bindMounts = {
    cursor = {
      hostPath = "${env.homeDir.host}/.icons";
      mountPoint = "${env.homeDir.local}/.icons";
    };
  };
}
