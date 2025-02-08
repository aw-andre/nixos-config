{
  programs.kitty = {
    enable = true;
    font.name = "JetBrains Mono";
    font.size = 15;
    themeFile = "VSCode_Dark";
    extraConfig = ''
      modify_font cell_height 150%
      cursor_trail 1
      cursor_trail_decay 0.1 0.3
      cursor_trail_start_threshold 0
    '';
  };
}
