{
  programs.kitty = {
    enable = true;
    font.name = "JetBrains Mono";
    font.size = 14;
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
      "ctrl+shift+/" = "show_scrollback";
      "ctrl+shift+." = "show_last_command_output";
      "ctrl+shift+b" = "scroll_page_up";
      "ctrl+shift+f" = "scroll_page_down";
      "ctrl+shift+^" = "scroll_home";
      "ctrl+shift+$" = "scroll_end";
      "ctrl+shift+u" = "scroll_to_prompt -1";
      "ctrl+shift+d" = "scroll_to_prompt 1";
      "ctrl+shift+0" = "change_font_size current 14.0";
      "ctrl+shift+minus" = "change_font_size current -1.0";
      "ctrl+shift+equal" = "change_font_size current +1.0";
    };
    themeFile = "VSCode_Dark";
    settings.scrollback_pager = "vimp";
    extraConfig = ''
      enable_audio_bell no
      modify_font cell_height 150%
      cursor_trail 1
      cursor_trail_decay 0.1 0.3
      cursor_trail_start_threshold 0
    '';
  };
}
