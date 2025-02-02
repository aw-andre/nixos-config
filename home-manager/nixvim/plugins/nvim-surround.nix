{
  plugins.nvim-surround = {
    enable = true;
    settings.keymaps = {
      insert = "<C-g>s";
      insert_line = "<C-g>S";
      normal = "gs";
      normal_cur = "gss";
      normal_line = "gS";
      normal_cur_line = "gSS";
      visual = "gs";
      visual_line = "gS";
      delete = "ds";
      change = "cs";
      change_line = "cS";
    };
  };
}
