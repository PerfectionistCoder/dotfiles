{
  AutofillAddressEnabled = false;
  AutofillCreditCardEnabled = false;
  Bookmarks = [
    {
      Title = "Firefox releases";
      URL = "https://www.mozilla.org/en-US/firefox/releases/";
    }
    {
      Title = "NixOS Search";
      URL = "https://search.nixos.org/packages";
    }
    {
      Title = "Home Manager Options";
      URL = "https://home-manager-options.extranix.com";
    }
    {
      Title = "Noogle";
      URL = "https://noogle.dev/";
    }
    {
      Title = "nixpkgs";
      URL = "https://github.com/NixOS/nixpkgs";
    }
    {
      Title = "Youtube Music";
      URL = "https://music.youtube.com/";
    }
    {
      Title = "Youtube";
      URL = "https://www.youtube.com";
    }
    {
      Title = "White board";
      URL = "https://excalidraw.com/";
    }
  ];
  DisableFeedbackCommands = true;
  DisableFirefoxAccounts = true;
  DisableFirefoxStudies = true;
  DisableForgetButton = true;
  DisableFormHistory = true;
  DisablePocket = true;
  DisableProfileImport = true;
  DisableSecurityBypass = {
    InvalidCertificate = true;
    SafeBrowsing = true;
  };
  DisableSetDesktopBackground = true;
  DisableTelemetry = true;
  DisplayBookmarksToolbar = "never";
  DisplayMenuBar = "never";
  DontCheckDefaultBrowser = true;
  EnableTrackingProtection = {
    Cryptomining = true;
    EmailTracking = true;
    Fingerprinting = true;
    Locked = true;
    Value = true;
  };
  FirefoxHome = {
    Highlights = false;
    Locked = true;
    Pocket = false;
    Search = false;
    Snippets = false;
    SponsoredPocket = false;
    SponsoredTopSites = false;
    TopSites = false;
  };
  HardwareAcceleration = true;
  HttpsOnlyMode = "force_enabled";
  NetworkPrediction = false;
  NoDefaultBookmarks = true;
  OfferToSaveLogins = false;
  OverrideFirstRunPage = "";
  OverridePostUpdatePage = "";
  PasswordManagerEnabled = false;
  Permissions = {
    Autoplay = {
      Default = "block-audio-video";
      Locked = true;
    };
    Camera = {
      BlockNewRequests = true;
      Locked = true;
    };
    Location = {
      BlockNewRequests = true;
      Locked = true;
    };
    Microphone = {
      BlockNewRequests = true;
      Locked = true;
    };
    Notifications = {
      BlockNewRequests = true;
      Locked = true;
    };
  };
  PictureInPicture = {
    Enabled = false;
    Locked = true;
  };
  PopupBlocking = {
    Default = true;
    Locked = true;
  };
  PostQuantumKeyAgreementEnabled = true;
  PromptForDownloadLocation = false;
  RequestedLocales = "";
  SSLVersionMin = "tls1.3";
  SearchBar = "unified";
  SearchEngines = {
    Add = [
      {
        Alias = "";
        Description = "A privacy-respecting, hackable metasearch engine";
        IconURL = "data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+CjxzdmcgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIiB4bWxuczpjYz0iaHR0cDovL2NyZWF0aXZlY29tbW9ucy5vcmcvbnMjIiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiIHhtbG5zOnN2Zz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgaWQ9InN2ZzgiIHZlcnNpb249IjEuMSIgdmlld0JveD0iMCAwIDkyIDkyIiBoZWlnaHQ9IjkybW0iIHdpZHRoPSI5Mm1tIj4KICA8ZGVmcyBpZD0iZGVmczIiLz4KICA8bWV0YWRhdGEgaWQ9Im1ldGFkYXRhNSI+CiAgICA8cmRmOlJERj4KICAgICAgPGNjOldvcmsgcmRmOmFib3V0PSIiPgogICAgICAgIDxkYzpmb3JtYXQ+aW1hZ2Uvc3ZnK3htbDwvZGM6Zm9ybWF0PgogICAgICAgIDxkYzp0eXBlIHJkZjpyZXNvdXJjZT0iaHR0cDovL3B1cmwub3JnL2RjL2RjbWl0eXBlL1N0aWxsSW1hZ2UiLz4KICAgICAgICA8ZGM6dGl0bGUvPgogICAgICA8L2NjOldvcms+CiAgICA8L3JkZjpSREY+CiAgPC9tZXRhZGF0YT4KICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNDAuOTIxMzAzLC0xNy40MTY1MjYpIiBpZD0ibGF5ZXIxIj4KICAgIDxjaXJjbGUgcj0iMCIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2U6IzAwMDAwMDtzdHJva2Utd2lkdGg6MTI7c3Ryb2tlLW1pdGVybGltaXQ6NDtzdHJva2UtZGFzaGFycmF5Om5vbmU7c3Ryb2tlLW9wYWNpdHk6MSIgY3k9IjkyIiBjeD0iNzUiIGlkPSJwYXRoMzcxMyIvPgogICAgPGNpcmNsZSByPSIzMCIgY3k9IjUzLjkwMjU1NyIgY3g9Ijc1LjkyMTMwMyIgaWQ9InBhdGg4MzQiIHN0eWxlPSJmaWxsOm5vbmU7ZmlsbC1vcGFjaXR5OjE7c3Ryb2tlOiMzMDUwZmY7c3Ryb2tlLXdpZHRoOjEwO3N0cm9rZS1taXRlcmxpbWl0OjQ7c3Ryb2tlLWRhc2hhcnJheTpub25lO3N0cm9rZS1vcGFjaXR5OjEiLz4KICAgIDxwYXRoIGQ9Im0gNjcuNTE0ODQ5LDM3LjkxNTI0IGEgMTgsMTggMCAwIDEgMjEuMDUxNDc1LDMuMzEyNDA3IDE4LDE4IDAgMCAxIDMuMTM3MzEyLDIxLjA3ODI4MiIgaWQ9InBhdGg4NTIiIHN0eWxlPSJmaWxsOm5vbmU7ZmlsbC1vcGFjaXR5OjE7c3Ryb2tlOiMzMDUwZmY7c3Ryb2tlLXdpZHRoOjU7c3Ryb2tlLW1pdGVybGltaXQ6NDtzdHJva2UtZGFzaGFycmF5Om5vbmU7c3Ryb2tlLW9wYWNpdHk6MSIvPgogICAgPHJlY3QgdHJhbnNmb3JtPSJyb3RhdGUoLTQ2LjIzNDcwOSkiIHJ5PSIxLjg2NjkxMDVlLTEzIiB5PSIxMjIuMDg5OTUiIHg9IjMuNzA2MzUyOSIgaGVpZ2h0PSIzOS45NjMzMDMiIHdpZHRoPSIxOC44NDYzMzEiIGlkPSJyZWN0OTEyIiBzdHlsZT0ib3BhY2l0eToxO2ZpbGw6IzMwNTBmZjtmaWxsLW9wYWNpdHk6MTtzdHJva2U6bm9uZTtzdHJva2Utd2lkdGg6ODtzdHJva2UtbWl0ZXJsaW1pdDo0O3N0cm9rZS1kYXNoYXJyYXk6bm9uZTtzdHJva2Utb3BhY2l0eToxIi8+CiAgPC9nPgo8L3N2Zz4=";
        Method = "POST";
        Name = "SearXNG";
        URLTemplate = "https://search.rhscz.eu/search?q=!go {searchTerms}&language=en";
      }
    ];
    Default = "SearXNG";
    PreventInstalls = true;
    Remove = [
      "Bing"
      "DuckDuckGo"
      "Google"
      "Wikipedia (en)"
    ];
  };
  StartDownloadsInTempDirectory = true;
  TranslateEnabled = false;
  UserMessaging = {
    ExtensionRecommendations = false;
    FeatureRecommendations = false;
    FirefoxLabs = false;
    Locked = true;
    MoreFromMozilla = false;
    SkipOnboarding = true;
    UrlbarInterventions = false;
  };
}
