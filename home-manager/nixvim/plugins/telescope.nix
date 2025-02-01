{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        live-grep-args.enable = true;
        ui-select.enable = true;
        undo.enable = true;
      };
    };
    keymaps = [
              {
                mode = "n";
                key = "<leader>fu";
                action.__raw = "require('telescope').extensions.undo.undo";
                options = { desc = "[F]ind [U]ndo"; };
              }
              {
                mode = "n";
                key = "<leader>fh";
                action.__raw = "require('telescope.builtin').help_tags";
                options = { desc = "[F]ind [H]elp"; };
              }
              {
                mode = "n";
                key = "<leader>fk";
                action.__raw = "require('telescope.builtin').keymaps";
                options = { desc = "[F]ind [K]eymaps"; };
              }
              {
                mode = "n";
                key = "<leader>ff";
                action.__raw = "require('telescope.builtin').find_files";
                options = { desc = "[F]ind [F]iles"; };
              }
  #            {
  #              mode = "n";
  #              key = "<leader>ft";
  #              action.__raw = "require('telescope.builtin').require('telescope.builtin')";
  #              options = { desc = "[F]ind in [T]elescope"; };
  #            }
              {
                mode = "n";
                key = "<leader>fw";
                action.__raw = "require('telescope.builtin').grep_string";
                options = { desc = "[F]ind current [W]ord"; };
              }
              {
                mode = "n";
                key = "<leader>fg";
                action.__raw = "require('telescope.builtin').live_grep";
                options = { desc = "[F]ind by [G]rep"; };
              }
              {
                mode = "n";
                key = "<leader>fd";
                action.__raw = "require('telescope.builtin').diagnostics";
                options = { desc = "[F]ind [D]iagnostics"; };
              }
              {
                mode = "n";
                key = "<leader>f.";
                action.__raw = "require('telescope.builtin').resume";
                options = { desc = "[F]ind [.] Repeat"; };
              }
              {
                mode = "n";
                key = "<leader>fr";
                action.__raw = "require('telescope.builtin').oldfiles";
                options = { desc = "[F]ind [R]ecent Files"; };
              }
              {
                mode = "n";
                key = "<leader>fb";
                action.__raw = "require('telescope.builtin').buffers";
                options = { desc = "[F]ind [B]uffers"; };
              }
              {
                mode = "n";
                key = "<leader>f%";
                action.__raw = "function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false, }) end";
                options = { desc = "[F]ind [%] in Current Buffer"; };
              }
              {
                mode = "n";
                key = "<leader>f/";
                action.__raw = "function() require('telescope.builtin').live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files', } end";
                options = { desc = "[F]ind [/] in Open Files"; };
              }
              {
                mode = "n";
                key = "<leader>fn";
                action.__raw = "function() require('telescope.builtin').find_files { cwd = '~/flake/home-manager/nixvim/' } end";
                options = { desc = "[F]ind [N]eovim files"; };
              }
    ];
    autoCmd = [
      {
        event = [ "VimEnter" ];
        callback.__raw = "function() if vim.fn.argc() == 0 and vim.fn.getline(1) == '' then require('telescope.builtin').find_files() end end";
      }
    ];
  };
}
