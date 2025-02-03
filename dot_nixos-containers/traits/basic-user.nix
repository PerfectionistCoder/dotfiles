{ env, ... }:
{
  config = {
    users = {
      mutableUsers = false;
      users = {
        "container" = {
          password = "";
          extraGroups = [ "wheel" ];
          isNormalUser = true;
          home = env.homeDir.local;
        };
      };
    };
    services.getty.autologinUser = "container";
  };
}
