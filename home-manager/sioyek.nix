{
  programs.sioyek = {
    enable = true;
    bindings = {
      move_down_smooth = "j";
      move_up_smooth = "k";
      move_left = "h";
      move_right = "l";
      next_page = "<C-f>";
      previous_page = "<C-b>";
      screen_down = "<C-d>";
      screen_up = "<C-u>";
      prev_state = "<C-o>";
      next_state = "<C-i>";
      new_window = "<C-w>s";
      close_window = "<C-w>q";
      goto_toc = "t";
      zoom_in = "<C-=>";
      fit_to_page_width = "<C-0>";
      zoom_out = "<C-->";
    };
    config = {
      should_launch_new_window = "1";
      ui_font = "JetBrainsMono Nerd Font";
      font_size = "16";
      status_bar_font_size = "16";
      startup_commands = "toggle_dark_mode";
      create_table_of_contents_if_not_exists = "1";
      collapsed_toc = "1";
      super_fast_search = "1";
    };
  };
}
