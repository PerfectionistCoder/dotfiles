// fonts
user_pref("font.default.x-western", "sans-serif");
user_pref("font.name.monospace.x-western", "monospace");
user_pref("font.name.sans-serif.x-western", "sans-serif");
user_pref("font.name.serif.x-western", "serif");
user_pref("font.size.monospace.x-western", 14);
user_pref("font.size.variable.x-western", 20);

// dns over https
user_pref("network.trr.mode", 3);
user_pref("network.trr.custom_uri", "https://dns.mullvad.net/dns-query");
user_pref("network.trr.uri", "https://dns.mullvad.net/dns-query");

// no session restore
user_pref("browser.sessionstore.max_resumed_crashes", 0);

// findbar highlight
user_pref("findbar.highlightAll", true);

// smooth scrolling
user_pref("apz.overscroll.enabled", true);
user_pref("general.smoothScroll", true);
user_pref("mousewheel.default.delta_multiplier_y", 275);
