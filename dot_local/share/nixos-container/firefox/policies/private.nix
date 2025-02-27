{
  CaptivePortal = false;
  Cookies = {
    Behavior = "reject-foreign";
    Locked = true;
  };
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
  PopupBlocking = {
    Default = true;
    Locked = true;
  };
  SanitizeOnShutdown = true;
}
