{
  programs.kitty = {
    enable = true;
    keybindings = {
      "ctrl+shift+/" = "show_scrollback";
      "ctrl+shift+." = "show_last_command_output";
      "ctrl+shift+;" = "move_tab_forward";
      "ctrl+shift+b" = "scroll_page_up";
      "ctrl+shift+f" = "scroll_page_down";
      "ctrl+shift+[" = "scroll_home";
      "ctrl+shift+]" = "scroll_end";
      "ctrl+shift+u" = "scroll_to_prompt -1";
      "ctrl+shift+d" = "scroll_to_prompt 1";
      "ctrl+shift+0" = "change_font_size current 14.0";
      "ctrl+shift+minus" = "change_font_size current -1";
      "ctrl+shift+equal" = "change_font_size current +1";
      "ctrl+shift+h" = "previous_tab";
      "ctrl+shift+l" = "next_tab";
      "ctrl+shift+left" = "previous_tab";
      "ctrl+shift+right" = "next_tab";
      "ctrl+shift+r" = "set_tab_title";
    };
    themeFile = "gruvbox-dark";
    settings = {
      term = "xterm-256color";
      scrollback_lines = 10000;
      scrollback_pager = ''
        nvim -c "silent! w! /tmp/kitty_scrollback_buffer | exec 'te cat /tmp/kitty_scrollback_buffer -' | exec 'norm G' | bn | bd!"
      '';
    };
    extraConfig = ''
      font_family Comic Code
      bold_font Comic Code Bold
      italic_font Comic Code Italic
      bold_italic_font Comic Code Bold Italic
      font_size 14.0
      window_padding_width 2 0
      background #000000
      tab_bar_edge top
      tab_bar_style powerline
      enable_audio_bell no
      modify_font cell_height 150%
      background_opacity 0.9
      cursor_shape_unfocused unchanged
      cursor_trail 1
      cursor_trail_decay 0.1 0.3
      cursor_trail_start_threshold 0
    '';
  };
}
