{
  keymaps = [
    {
      mode = "n";
      key = "[d";
      action.__raw = "vim.diagnostic.goto_prev";
      options.desc = "Go to previous [D]iagnostic message";
    }
    {
      mode = "n";
      key = "]d";
      action.__raw = "vim.diagnostic.goto_next";
      options.desc = "Go to next [D]iagnostic message";
    }
    {
      mode = "n";
      key = "<leader>e";
      action.__raw = "vim.diagnostic.open_float";
      options.desc = "Show diagnostic [E]rror messages";
    }
    {
      mode = "n";
      key = "<leader>q";
      action.__raw = "vim.diagnostic.setloclist";
      options.desc = "Open diagnostic [Q]uickfix list";
    }
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
      mode = "n";
      key = "J";
      action = "mzJ`z";
      options.desc = "Join lower line";
    }
    {
      mode = "v";
      key = "J";
      action = "<CMD>m '>+1<CR>gv=gv";
      options.desc = "Join lower line";
    }
#    {
#      mode = "n";
#      key = "<C-f>";
#      action = "<C-f>zz";
#      options.desc = "Move down one page and center";
#    }
#    {
#      mode = "n";
#      key = "<C-b>";
#      action = "<C-b>zz";
#      options.desc = "Move up one page and center";
#    }
#    {
#      mode = "n";
#      key = "<C-d>";
#      action = "<C-d>zz";
#      options.desc = "Move down half a page and center";
#    }
#    {
#      mode = "n";
#      key = "<C-u>";
#      action = "<C-u>zz";
#      options.desc = "Move up half a page and center";
#    }
#    {
#      mode = "n";
#      key = "n";
#      action = "nzzzv";
#      options.desc = "Go to next search and center";
#    }
#    {
#      mode = "n";
#      key = "N";
#      action = "Nzzzv";
#      options.desc = "Go to previous search and center";
#    }
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
      options.desc = "Set nohlsearch";
    }
    {
      mode =  [ "n" "v" ];
      key = "k";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = { expr = true; silent = true; };
    }
    {
      mode =  [ "n" "v" ];
      key = "j";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = { expr = true; silent = true; };
    }
  ];
}
