{
  "3rdparty" = {
    Extensions = {
      "uBlock0@raymondhill.net" = {
        adminSettings = {
          dynamicFilteringString = "behind-the-scene * * noop\nbehind-the-scene * inline-script noop\nbehind-the-scene * 1p-script noop\nbehind-the-scene * 3p-script noop\nbehind-the-scene * 3p-frame noop\nbehind-the-scene * image noop\nbehind-the-scene * 3p noop\n* * 3p-frame block";
          hostnameSwitchesString = "no-large-media: behind-the-scene false\nno-csp-reports: * true";
          selectedFilterLists = [
            "user-filters"
            "ublock-filters"
            "ublock-badware"
            "ublock-privacy"
            "ublock-quick-fixes"
            "ublock-unbreak"
            "easylist"
            "easyprivacy"
            "adguard-spyware"
            "urlhaus-1"
            "curben-phishing"
            "plowe-0"
            "fanboy-cookiemonster"
            "ublock-cookies-easylist"
            "fanboy-social"
            "easylist-chat"
            "easylist-newsletters"
            "easylist-notifications"
            "easylist-annoyances"
            "ublock-annoyances"
          ];
        };
      };
    };
  };
  Cookies = {
    Behavior = "reject";
    Locked = true;
  };
  ExtensionSettings = {
    "*" = {
      installation_mode = "blocked";
    };
    "uBlock0@raymondhill.net" = {
      default_area = "menupanel";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
      installation_mode = "force_installed";
    };
  };
  SanitizeOnShutdown = true;
}
