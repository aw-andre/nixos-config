{ pkgs, ... }:
{
  programs.qutebrowser = {
    enable = true;
    settings.colors.webpage.darkmode.enabled = true;
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
        "<Ctrl-1>" = "tab-focus 1";
        "<Ctrl-2>" = "tab-focus 2";
        "<Ctrl-3>" = "tab-focus 3";
        "<Ctrl-4>" = "tab-focus 4";
        "<Ctrl-5>" = "tab-focus 5";
        "<Ctrl-6>" = "tab-focus 6";
        "<Ctrl-7>" = "tab-focus 7";
        "<Ctrl-8>" = "tab-focus 8";
        "<Ctrl-9>" = "tab-focus 9";
      };
    };
  };
  home.packages = with pkgs; [
    rofi
    keyutils
  ];
}
