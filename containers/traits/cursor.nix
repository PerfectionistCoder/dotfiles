{ env, ... }:
{
  bindMounts = {
    cursor = {
      hostPath = "${env.homeDir.host}/.local/share/icons";
      mountPoint = "${env.homeDir.local}/.local/share/icons";
    };
  };
}
