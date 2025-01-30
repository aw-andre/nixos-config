{
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
      undo.enable = true;
      live-grep-args.enable = true;
    };
  };
  keymaps = [
            {
              mode = "n";
              key = "<leader>fh";
              action = "<Cmd>Telescope help_tags<CR>";
              options = { desc = "[F]ind [H]elp"; };
            }
            {
              mode = "n";
              key = "<leader>fk";
              action = "<Cmd>Telescope keymaps<CR>";
              options = { desc = "[F]ind [K]eymaps"; };
            }
            {
              mode = "n";
              key = "<leader>ff";
              action = "<Cmd>Telescope find_files<CR>";
              options = { desc = "[F]ind [F]iles"; };
            }
#            {
#              mode = "n";
#              key = "<leader>ft";
#              action = "<Cmd>Telescope telescope.builtin<CR>";
#              options = { desc = "[F]ind in [T]elescope"; };
#            }
            {
              mode = "n";
              key = "<leader>fw";
              action = "<Cmd>Telescope grep_string<CR>";
              options = { desc = "[F]ind current [W]ord"; };
            }
            {
              mode = "n";
              key = "<leader>fg";
              action = "<Cmd>Telescope live_grep<CR>";
              options = { desc = "[F]ind by [G]rep"; };
            }
            {
              mode = "n";
              key = "<leader>fd";
              action = "<Cmd>Telescope diagnostics<CR>";
              options = { desc = "[F]ind [D]iagnostics"; };
            }
            {
              mode = "n";
              key = "<leader>f.";
              action = "<Cmd>Telescope resume<CR>";
              options = { desc = "[F]ind [.] Repeat"; };
            }
            {
              mode = "n";
              key = "<leader>fr";
              action = "<Cmd>Telescope oldfiles<CR>";
              options = { desc = "[F]ind [R]ecent Files"; };
            }
            {
              mode = "n";
              key = "<leader>fb";
              action = "<Cmd>Telescope buffers<CR>";
              options = { desc = "[F]ind [B]uffers"; };
            }
            {
              mode = "n";
              key = "<leader>fu";
              action = "<Cmd>Telescope undoCR>";
              options = { desc = "[F]ind [U]ndotree"; };
            }
#            {
#              mode = "n";
#              key = "<leader>f%";
#              action = "function() <Cmd>Telescope current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, }) end<CR>";
#              options = { desc = "[F]ind [%] in Current Buffer"; };
#            }
#            {
#              mode = "n";
#              key = "<leader>f/";
#              action = "function() <Cmd>Telescope live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files', } end<CR>";
#              options = { desc = "[F]ind [/] in Open Files"; };
#            }
#            {
#              mode = "n";
#              key = "<leader>fn";
#              action = "<Cmd>Telescope find_files ~/flake/home-manager/nixvim/<CR>";
#              options = { desc = "[F]ind [N]eovim files"; };
#            }
  ];
  autoCmd = [
    {
      event = [ "VimEnter" ];
      callback.__raw = "function() if vim.fn.argc() == 0 and vim.fn.getline(1) == '' then require('telescope.builtin').find_files() end end";
    }
  ];
}
