{ variables, ... }:
{
  config = {
    users = {
      mutableUsers = false;
      users = {
        "container" = {
          password = "";
          extraGroups = [ "wheel" ];
          isNormalUser = true;
          home = variables.homeDir.local;
        };
      };
    };
    services.getty.autologinUser = "container";
  };
}
