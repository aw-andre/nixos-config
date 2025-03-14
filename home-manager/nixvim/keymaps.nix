{
  keymaps = [
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w><C-h>";
      options.desc = "Move focus to the left window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w><C-l>";
      options.desc = "Move focus to the right window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w><C-j>";
      options.desc = "Move focus to the lower window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w><C-k>";
      options.desc = "Move focus to the upper window";
    }
    {
      mode = "t";
      key = "<C-Esc>";
      action = "<C-\\><C-n>";
      options.desc = "Exit terminal mode";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>d";
      action = "\"_d";
      options.desc = "Delete without yanking";
    }
    {
      mode = "v";
      key = "<leader>p";
      action = "\"_dP";
      options.desc = "Put without yanking";
    }
    {
      mode = "n";
      key = "<Esc>";
      action = "<CMD>nohlsearch<CR>";
      options.desc = "Turn off search highlighting";
    }
    {
      mode = "n";
      key = "J";
      action = "m`J``";
      options.desc = "Join lower line";
    }
    # {
    #   mode = "v";
    #   key = "y";
    #   action = "m`y``";
    #   options.desc = "Yank in visual mode";
    # }
    {
      mode = "v";
      key = "J";
      action = "<CMD>m '>+1<CR>gv=gv";
      options.desc = "Join lower line";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "k";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        expr = true;
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "j";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        expr = true;
        silent = true;
      };
    }
  ];
}
