{ pkgs, ... }: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/http" = [ "org.qutebrowser.qutebrowser.desktop" ];
      "x-scheme-handler/https" = [ "org.qutebrowser.qutebrowser.desktop" ];
      "text/html" = [ "org.qutebrowser.qutebrowser.desktop" ];
    };
  };
  programs.qutebrowser = {
    enable = true;
    searchEngines.DEFAULT = "https://google.com/search?hl=en&q={}";
    settings = {
      colors.webpage.darkmode.enabled = true;
      downloads.location = {
        directory = "~/files/temp/";
        prompt = false;
      };
      fonts = {
        default_size = "16px";
        default_family = "JetBrainsMono Nerd Font";
      };
    };
    keyMappings = {
      "<Ctrl-[>" = "<Escape>";
      "<Ctrl-m>" = "<Return>";
      "<Ctrl-i>" = "<Tab>";
      "<Ctrl-h>" = "<Backspace>";
    };
    keyBindings = {
      normal = {
        "<Tab>" = "spawn --userscript qute-bitwarden";
        "<Ctrl-0>" = "tab-focus 10";
        "gt" = "tab-next";
        "gT" = "tab-prev";
        "H" = "tab-prev";
        "L" = "tab-next";
        "<Left>" = "tab-prev";
        "<Right>" = "tab-next";
        "u" = "back";
        "<Ctrl-r>" = "forward";
        "J" = "forward";
        "K" = "back";
        "<Down>" = "forward";
        "<Up>" = "back";
        "x" = "tab-close";
        "X" = "tab-close -o";
        "d" = "nop";
        "D" = "nop";
      };
    };
    extraConfig = ''
      for i in range(1, 100):
        config.bind(f'{i}gt', f'tab-focus {i}')
      for i in range(1, 10):
        config.bind(f'<Ctrl-{i}>', f'tab-focus {i}')
    '';
  };
  home.packages = with pkgs; [ rofi keyutils ];
}
