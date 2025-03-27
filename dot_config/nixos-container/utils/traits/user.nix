{ var, ... }:
{
  config = {
    users = {
      mutableUsers = false;
      allowNoPasswordLogin = true;
      users = {
        container = {
          inherit (var) home;
          isNormalUser = true;
        };
      };
    };
    services.getty.autologinUser = "container";
    console.enable = true;
  };
}
