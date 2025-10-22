{
  plugins.yanky = {
    enable = true;
    settings.highlight = {
      on_put = false;
      on_yank = false;
    };
  };
  keymaps = [
    {
      mode = [ "n" "v" ];
      key = "y";
      action = "<Plug>(YankyYank)";
      options.desc = "Put Before";
    }
    {
      mode = [ "n" "v" ];
      key = "p";
      action = "<Plug>(YankyPutAfter)";
      options.desc = "Put Before";
    }
    {
      mode = [ "n" "v" ];
      key = "P";
      action = "<Plug>(YankyPutBefore)";
      options.desc = "Put After";
    }
    {
      mode = [ "n" "v" ];
      key = "gp";
      action = "<Plug>(YankyGPutAfter)";
      options.desc = "Put Before and Move Cursor";
    }
    {
      mode = [ "n" "v" ];
      key = "gP";
      action = "<Plug>(YankyGPutBefore)";
      options.desc = "Put After and Move Cursor";
    }
    {
      mode = "n";
      key = "<C-p>";
      action = "<Plug>(YankyPreviousEntry)";
      options.desc = "Cycle Last Put Item Backward";
    }
    {
      mode = "n";
      key = "<C-n>";
      action = "<Plug>(YankyNextEntry)";
      options.desc = "Cycle Last Put Item Forward";
    }
    {
      mode = "n";
      key = "<leader>fy";
      action.__raw =
        "require('telescope').extensions.yank_history.yank_history";
      options.desc = "[F]ind in [Y]ank Ring";
    }
  ];
}
