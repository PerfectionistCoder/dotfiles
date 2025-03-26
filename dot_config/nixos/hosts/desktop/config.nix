{ ... }:
let
  username = "user";
in
{
  users = {
    users = {
      ${username} = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "machine"
        ];
      };
    };
  };
  services.getty.autologinUser = username;

  features = {
    extra-container.enable = true;
    minimal-bash.enable = true;
    resolved.enable = true;
    river.enable = true;
  };

  networking.nameservers = [
    "194.242.2.2#dns.mullvad.net"
  ];

  boot.loader.timeout = 1;
}
