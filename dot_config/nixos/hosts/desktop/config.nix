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
    fish.enable = true;
    fonts.enable = true;
    graphics.enable = true;
    minimal-bash.enable = true;
    minimal.enable = true;
    pipewire.enable = true;
    resolved.enable = true;
    river.enable = true;
  };

  networking.nameservers = [
    "194.242.2.2#dns.mullvad.net"
  ];

  boot.loader.timeout = 1;

  documentation = {
    enable = true;
    man.enable = true;
  };

  systemd.services.disable-usb-controller = {
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''/bin/sh -c "echo XHC0 > /proc/acpi/wakeup"'';
    };
    wantedBy = [ "multi-user.target" ];
  };
}
