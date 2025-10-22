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
      mode = "n";
      key = "<C-Left>";
      action = "<C-w><C-h>";
      options.desc = "Move focus to the left window";
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = "<C-w><C-l>";
      options.desc = "Move focus to the right window";
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = "<C-w><C-j>";
      options.desc = "Move focus to the lower window";
    }
    {
      mode = "n";
      key = "<C-Up>";
      action = "<C-w><C-k>";
      options.desc = "Move focus to the upper window";
    }
    {
      mode = "t";
      key = "<S-Esc>";
      action = "<C-\\><C-n>";
      options.desc = "Exit terminal mode";
    }
    {
      mode = [ "n" "v" ];
      key = "<leader>d";
      action = ''"_d'';
      options.desc = "Delete without yanking";
    }
    {
      mode = "v";
      key = "<leader>p";
      action = ''"_dP'';
      options.desc = "Put without yanking";
    }
    {
      mode = "n";
      key = "<Esc>";
      action = "<CMD>nohlsearch<CR>";
      options.desc = "Turn off search highlighting";
    }
    # {
    #   mode = "n";
    #   key = "J";
    #   action = "m`J``";
    #   options.desc = "Join lower line";
    # }
    # {
    #   mode = [ "n" "v" ];
    #   key = "<C-^>";
    #   action = "<C-6>";
    #   options = {
    #     silent = true;
    #     remap = true;
    #   };
    # }
    {
      mode = [ "n" "v" ];
      key = "<Left>";
      action = "h";
      options = {
        silent = true;
        remap = true;
      };
    }
    {
      mode = [ "n" "v" ];
      key = "<Down>";
      action = "j";
      options = {
        silent = true;
        remap = true;
      };
    }
    {
      mode = [ "n" "v" ];
      key = "<Up>";
      action = "k";
      options = {
        silent = true;
        remap = true;
      };
    }
    {
      mode = [ "n" "v" ];
      key = "<Right>";
      action = "l";
      options = {
        silent = true;
        remap = true;
      };
    }
    {
      mode = [ "n" "v" ];
      key = "g<Left>";
      action = "gh";
      options = {
        silent = true;
        remap = true;
      };
    }
    {
      mode = [ "n" "v" ];
      key = "g<Down>";
      action = "gj";
      options = {
        silent = true;
        remap = true;
      };
    }
    {
      mode = [ "n" "v" ];
      key = "g<Up>";
      action = "gk";
      options = {
        silent = true;
        remap = true;
      };
    }
    {
      mode = [ "n" "v" ];
      key = "g<Right>";
      action = "gl";
      options = {
        silent = true;
        remap = true;
      };
    }
    {
      mode = [ "n" "v" ];
      key = "z<Left>";
      action = "zh";
      options = {
        silent = true;
        remap = true;
      };
    }
    {
      mode = [ "n" "v" ];
      key = "z<Down>";
      action = "zj";
      options = {
        silent = true;
        remap = true;
      };
    }
    {
      mode = [ "n" "v" ];
      key = "z<Up>";
      action = "zk";
      options = {
        silent = true;
        remap = true;
      };
    }
    {
      mode = [ "n" "v" ];
      key = "z<Right>";
      action = "zl";
      options = {
        silent = true;
        remap = true;
      };
    }
    {
      mode = [ "n" "v" ];
      key = "k";
      action = "v:count == 0 ? 'gk' : ('m`' . v:count . 'k')";
      options = {
        expr = true;
        silent = true;
      };
    }
    {
      mode = [ "n" "v" ];
      key = "j";
      action = "v:count == 0 ? 'gj' : ('m`' . v:count . 'j')";
      options = {
        expr = true;
        silent = true;
      };
    }
  ];
}
