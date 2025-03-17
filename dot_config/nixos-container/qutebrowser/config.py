config.load_autoconfig(False)
config.source("bindings.py")

c.aliases = {}

c.colors.webpage.preferred_color_scheme = "dark"

c.completion.cmd_history_max_items = -1
c.completion.height = "30%"
c.completion.open_categories = ["searchengines", "bookmarks", "history"]
c.completion.shrink = True
c.completion.web_history.max_items = -1

c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://secure.fanboy.co.nz/fanboy-annoyance.txt",
]
c.content.blocking.method = "both"
c.content.canvas_reading = False
c.content.cookies.accept = "no-3rdparty"
c.content.cookies.store = False
c.content.fullscreen.overlay_timeout = 0
c.content.geolocation = False
c.content.headers.accept_language = "en-US,en;q=0.5"
c.content.headers.custom = {
    "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
}
c.content.headers.do_not_track = False
c.content.headers.referer = "never"
c.content.headers.user_agent = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/{webkit_version} (KHTML, like Gecko) Chrome/{upstream_browser_version} Safari/{webkit_version}"
c.content.javascript.clipboard = "access"
c.content.notifications.enabled = False
c.content.pdfjs = True
c.content.webgl = False
c.content.webrtc_ip_handling_policy = "default-public-interface-only"

c.downloads.location.prompt = False

c.fonts.default_size = "16px"
c.fonts.web.size.default = 20
c.fonts.web.size.default_fixed = 16
c.fonts.web.size.minimum = 14

c.keyhint.delay = 0

c.statusbar.widgets = ["keypress", "history", "progress", "url", "search_match"]

c.tabs.last_close = "close"
c.tabs.title.format = "{audio} {current_title}"
c.tabs.undo_stack_size = -1

c.url.default_page = "about:blank"
c.url.searchengines = {"DEFAULT": "https://search.rhscz.eu/search?q={}"}
c.url.start_pages = "https://search.rhscz.eu/preferences?preferences=eJx1WMuO6zgO_ZrJxuigp-9gGrPIaoDe9gDTe0O2GJvXsuirRxLX1zfpR0yV6y7KFR9JFEmRh5Rbk6CjgBBvHXgIxl2c8V02HdzAXxy1xi2_TE7U0jg5SHC73M0DW_J1gEjuAeF2wZGX1FOg13z7K2S4jJB6srf__fn_vy7R3CGCCW1_-_WSehjhFlFkXVhAdinWLMvDs06muf1hXISLJTykk-HXK4Xusi6rY5pZLdHp0oJPEGrjsPMj_153N_ZhfAu23rZdhf7IEOYafZ0w8fplJvo7ekwssw3k3Aquq0SrdnXQzIIctJv0ntIAc7xZuBtW_5KDq-8URpMS-u42BUhpvliMpnGsA_gOPXv4279_3QTXm7P_8dt_32D1QAsU63r9z0P_6UxX15FaNK4awaJh0LT37NUkdk0DVeTTGep6OYVP6Cr36xWVyRZ5bMwRWxly8DLeBjRaReMm1r9y6POrmkw7yCa8WZIx702sRH98QF3f0a37T0M1YggUNMZHV_FT9g56sjccTNZsIj2-KFZPHHDfIw5ancagzSegWm1XPljhweB9lywyJ_FjsRodyp_yUIOpye0AaVvXTE2xIlnsukP_5WiubdteLSgp7BL2DVUc2KwWcdwHhe7qfsb3KHjjjrK9OxPAoFainTjM7hCAw3xTkwM4RgY5ZloUfMWe9oGcW2rtDNOn17P3BFw1l6dI4ihHKFTIQbafNWYBPjgd3xFlISaTUBlkbVdx4kjSIfmoF4swtvecJMBWoD1kyEFak4pztHxi8tfR2Rg1dsoyNVbYq_AnGNn42H8N5dFMPJ2fouFI3_fY2mcxGcBceOyfL6XU3QYSo_YwYpfY1Js0Mj_qaQE4W-menhwDlcXANCSEtJ75PaAf0LR6wTwrV3WAHz2zn0KY_EyzxwxZaCB02yuPAYcyjfs7keXIs3o5UcfGT87MkszxMECPjMRBp93M5AhBiEwKhz6b3jTByGPbsmeCgbAexQrA6x3gLCRehbGWdxxtcyiGY5eDEsz5pPZHzz-Rcvwa2-OVzzBwZM5azg-cNTt8x9jTsS2zRzBhruSUIyp3yACkYHx0rLYOA2bS7lEEr6MmJriG3WaunqadjN9f6aMvsn98jo3TgJ_2I_OzMYcSZOcImpVoAr-pfNggIG8JVEIBJlIGrdSPcadFJqBzqr7BcxYeQ3sSfrWsSMIpN0yqj23DH0_jk14VwFpMpxoZsOtTZQ0Vcykl7g-IA5E08a7bjnPE8pAidZRPwNmqFT7Rygo_oeWMPjgFY5tjvE4zN0f74bbG2llybsxb5C3OxV96cnDCV3UlbSt5vNGRXYNtFVteZYIuAUzAIU3SniljEg0zJeJIHiTK9iNOYhTLMIXlGt0sSUXqzaanwtlPbObyfcCGaIifwR-ZSrcLGCmH9oxO0C6c8hP4sFhg7hvj4rVy9oPmT554krsHM3KT05f1BNv0Qb6YO85Mzky-1TutbUHv3779_jqcabMFrwPtw5uxEEffAYYzcg6yDS9yY6HYCR2lYw9vHlKnVNTnZu5g3HllAggpN5oQlqTh5YN0CU9o1NBsyuIu72fdQmYu0hIdOz8yWWjsSS8cyHMyV3H25GepcYdnYAilcSt0TrYFPicbn0dbMEN8dMJeaumDi-3SwqpmcOQupDAwj6ObC24_OHmNyj6nozYWDDZ01452trqAL5v_hdvWFlq3toGTVvft4YUPHcoNt-OtGaejQjVcPMr-1XdfNL-CFh5dkJPnhOYlVXTH0fZwH0ho_d2zwQOZX1hb3VSRFOqqz3svcXRMRe-W5pG45Hh14HeH7aBrNU9HXYY7Yeq9zHNTcmyyNhl6g63tOLlgwwsnbNjJDRv-BXv2237L5gOrbaKu8TCOc7Vz9EpDZS1aZ-QI4WdjXGPTz8ZEMrviPPzxy7uI635DGhG68zLP4R8LBjF867Lkf6LKe7g3sWe-_2KGfXcj-FpuJcdxcfEZEPYOTmLKcJ8qHXqEVFDzPsaFnWPAbFeAcpyzGSBxX70315MVxjomTXwBl_K5jaJ8AYCoY3OSXlyd7_J-XdQ9tJ5Q-snGKB9OxNkWuXG30nTu4boqW1nuHdCvgXZceY89czPKpkrPeULdupSxuEKnsF3hU4QGw51q1fBFKOr7VeQKYPYuTDUfmWmjPCNuA9qBONfvjp7HzTo32ae8U1zm9jfH90m-W4dP5PyGv-iGHFq-n4Q1ane_Zh_5WhB7fcGUnqGUO1P-VJzeyPs-adAxn0jcqGkPHItPHMKwhWQGZEnR9MokyS-OwOvJDj14Ogs9-OkLih5ajD988KRgPQ7qfkiU5NIn7v6UbE_jXM-13GuVUgpXVA0Fp_ujYMIFONuywicrVrisEelf-3eN4_PV5DKXsHh7l7QdEKrYXsSasFzcavkYFrhL4ki7cJfJ6Xz7G8MmsHQ="
