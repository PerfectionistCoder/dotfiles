{ variables, ... }:
{
  config = {
    users = {
      mutableUsers = false;
      allowNoPasswordLogin = true;
      users = {
        root.hashedPassword = "!";
        container = {
          isNormalUser = true;
          home = variables.homeDir.local;
        };
      };
    };
    services.getty.autologinUser = "container";
  };
}
