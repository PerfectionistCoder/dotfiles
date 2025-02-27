{
  DisableSecurityBypass = {
    InvalidCertificate = true;
    SafeBrowsing = true;
  };
  ExtensionSettings = {
    "*" = {
      installation_mode = "blocked";
    };
  };
  HttpsOnlyMode = "force_enabled";
  SSLVersionMin = "tls1.3";
}
