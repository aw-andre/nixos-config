{
  programs.kitty = {
    enable = true;
    font.name = "JetBrains Mono";
    font.size = 14;
    themeFile = "VSCode_Dark";
    settings.scrollback_pager = ''
      nvim -c "silent! w! /tmp/kitty_scrollback_buffer | exec 'te cat /tmp/kitty_scrollback_buffer -' | exec 'norm G' | bn | bd!"
    '';
    extraConfig = ''
      modify_font cell_height 150%
      cursor_trail 1
      cursor_trail_decay 0.1 0.3
      cursor_trail_start_threshold 0
    '';
  };
}
