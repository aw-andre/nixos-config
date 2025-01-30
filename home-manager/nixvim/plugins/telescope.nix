{
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
      undo.enable = true;
    };
  };
  keys = [
            {
              mode = "n";
              key = "<leader>fh";
              action = "telescope.builtin.help_tags";
              options = { desc = "[F]ind [H]elp"; };
            }
            {
              mode = "n";
              key = "<leader>fk";
              action = "telescope.builtin.keymaps";
              options = { desc = "[F]ind [K]eymaps"; };
            }
            {
              mode = "n";
              key = "<leader>ff";
              action = "telescope.builtin.find_files";
              options = { desc = "[F]ind [F]iles"; };
            }
            {
              mode = "n";
              key = "<leader>ft";
              action = "telescope.builtin.telescope.builtin";
              options = { desc = "[F]ind in [T]elescope"; };
            }
            vim.keymap.set("n", "<leader>fw", "telescope.builtin.grep_string", { desc = "[F]ind current [W]ord"; })
            {
              mode = "n";
              key = "<leader>fw";
              action = "telescope.builtin.grep_string";
              options = { desc = "[F]ind current [W]ord"; };
            }
            vim.keymap.set("n", "<leader>fg", "telescope.builtin.live_grep", { desc = "[F]ind by [G]rep"; })
            {
              mode = "n";
              key = "<leader>fg";
              action = "telescope.builtin.live_grep";
              options = { desc = "[F]ind by [G]rep"; };
            }
            vim.keymap.set("n", "<leader>fd", "telescope.builtin.diagnostics", { desc = "[F]ind [D]iagnostics"; })
            {
              mode = "n";
              key = "<leader>fd";
              action = "telescope.builtin.diagnostics";
              options = { desc = "[F]ind [D]iagnostics"; };
            }
            vim.keymap.set("n", "<leader>f.", "telescope.builtin.resume", { desc = "[F]ind [.] Repeat"; })
            {
              mode = "n";
              key = "<leader>f.";
              action = "telescope.builtin.resume";
              options = { desc = "[F]ind [.] Repeat"; };
            }
            {
              mode = "n";
              key = "<leader>fr";
              action = "telescope.builtin.oldfiles";
              options = { desc = "[F]ind [R]ecent Files"; };
            }
            {
              mode = "n";
              key = "<leader>fb";
              action = "telescope.builtin.buffers";
              options = { desc = "[F]ind [B]uffers"; };
            }
            {
              mode = "n";
              key = "<leader>f%";
              action = "function() telescope.builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, }) end";
              options = { desc = "[F]ind [%] in Current Buffer"; };
            }
            {
              mode = "n";
              key = "<leader>f/";
              action = "function() telescope.builtin.live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files', } end";
              options = { desc = "[F]ind [/] in Open Files"; };
            }
            {
              mode = "n";
              key = "<leader>fn";
              action = "function() telescope.builtin.find_files { cwd = vim.fn.stdpath 'config' } end";
              options = { desc = "[F]ind [N]eovim files"; };
            }
  ];
}
