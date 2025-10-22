{
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
      live-grep-args.enable = true;
      ui-select.enable = true;
      undo.enable = true;
    };
    settings.defaults = {
      layout_strategy.__raw = ''
        string.find(
          vim.fn.system("hyprctl monitors -j | jq 'any(.transform == 3)'"),
          "true"
        )
        and
          "vertical"
        or
          "horizontal"
      '';
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>fu";
      action.__raw = "require('telescope').extensions.undo.undo";
      options.desc = "[F]ind [U]ndo";
    }
    {
      mode = "n";
      key = "<leader>fh";
      action.__raw = "require('telescope.builtin').help_tags";
      options.desc = "[F]ind [H]elp";
    }
    {
      mode = "n";
      key = "<leader>fk";
      action.__raw = "require('telescope.builtin').keymaps";
      options.desc = "[F]ind [K]eymaps";
    }
    {
      mode = "n";
      key = "<leader>ff";
      action.__raw = "require('telescope.builtin').find_files";
      options.desc = "[F]ind [F]iles";
    }
    {
      mode = "n";
      key = "<leader>fd";
      action.__raw = "require('telescope.builtin').diagnostics";
      options.desc = "[F]ind [D]iagnostics";
    }
    {
      mode = "n";
      key = "<leader>f.";
      action.__raw = "require('telescope.builtin').resume";
      options.desc = "[F]ind [.] Repeat";
    }
    {
      mode = "n";
      key = "<leader>ft";
      action.__raw = "require('telescope.builtin').builtin";
      options.desc = "[F]ind in [T]elescope";
    }
    {
      mode = "n";
      key = "<leader>fr";
      action.__raw = "require('telescope.builtin').oldfiles";
      options.desc = "[F]ind [R]ecent Files";
    }
    {
      mode = "n";
      key = "<leader>fg";
      action.__raw = "require('telescope.builtin').git_files";
      options.desc = "[F]ind [G]it Files";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action.__raw = "require('telescope.builtin').buffers";
      options.desc = "[F]ind [B]uffers";
    }
    {
      mode = "n";
      key = "<leader>f/";
      action.__raw = "require('telescope.builtin').current_buffer_fuzzy_find";
      options.desc = "[F]ind [/] in Current Buffer";
    }
    {
      mode = "n";
      key = "<leader>gw";
      action.__raw = "require('telescope.builtin').grep_string";
      options.desc = "[G]rep [W]ord in Files";
    }
    {
      mode = "n";
      key = "<leader>gf";
      action.__raw = "require('telescope.builtin').live_grep";
      options.desc = "[G]rep in [F]iles";
    }
    {
      mode = "n";
      key = "<leader>go";
      action.__raw =
        "function() require('telescope.builtin').live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files', } end";
      options.desc = "[G]rep in [O]pen Files";
    }
  ];
  autoCmd = [
    {
      event = [ "StdinReadPost" ];
      callback.__raw = "function() stdin = 1 end";
    }
    {
      event = [ "VimEnter" ];
      callback.__raw = builtins.readFile ./grep-files.lua;
    }
  ];
}
