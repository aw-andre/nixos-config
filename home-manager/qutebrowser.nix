{ pkgs, ... }:
{
  programs.qutebrowser = {
    enable = true;
    searchEngines.DEFAULT = "https://google.com/search?hl=en&q={}";
    settings = {
      colors.webpage.darkmode.enabled = true;
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
        "<Ctrl-->" = "zoom-out";
        "<Ctrl-=>" = "zoom-in";
        "<Ctrl-0>" = "zoom";
        "gt" = "tab-next";
        "gT" = "tab-prev";
        "u" = "back";
        "<Ctrl-r>" = "forward";
        "x" = "tab-close";
        "X" = "tab-close -o";
      };
    };
    extraConfig = ''
      for i in range(1, 100):
        config.bind(f'{i}gt', f'tab-focus {i}')
    '';
  };
  home.packages = with pkgs; [
    rofi
    keyutils
  ];
}
