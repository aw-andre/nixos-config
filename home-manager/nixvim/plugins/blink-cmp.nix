{
  plugins = {
    # blink-cmp-copilot.enable = true;
    blink-cmp-dictionary.enable = true;
    blink-cmp-git.enable = true;
    # blink-cmp-spell.enable = true;
    blink-compat.enable = true;
    blink-copilot.enable = true;
    blink-emoji.enable = true;
    # blink-ripgrep.enable = true;
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;
      settings.sources = {
        default = [
          "lsp"
          "path"
          "snippets"
          "buffer"
          "dictionary"
          "git"
          # "spell"
          "copilot"
          "emoji"
          # "ripgrep"
        ];
        providers = {
          buffer = {
            enabled = true;
            score_offset = 0;
          };
          lsp = {
            name = "LSP";
            enabled = true;
            score_offset = 10;
          };
          dictionary = {
            module = "blink-cmp-dictionary";
            name = "Dict";
            enabled.__raw = ''
              function()
                  return vim.tbl_contains({ 'gitcommit', 'markdown', 'text' }, vim.bo.filetype)
              end
            '';
            score_offset = 50;
            min_keyword_length = 3;
            # Optional configurations
            opts = { };
          };
          git = {
            module = "blink-cmp-git";
            name = "Git";
            enabled.__raw = ''
              function()
                  return vim.tbl_contains({ 'gitcommit', 'markdown', 'text' }, vim.bo.filetype)
              end
            '';
            score_offset = 100;
            opts = {
              commit = { };
              git_centers = { git_hub = { }; };
            };
          };
          # spell = {
          #   module = "blink-cmp-spell";
          #   name = "Spell";
          #   score_offset = -60;
          #   opts = { };
          # };
          copilot = {
            async = true;
            module = "blink-copilot";
            name = "Copilot";
            score_offset = -10;
            # Optional configurations
            opts = {
              max_completions = 3;
              max_attempts = 4;
              kind = "Copilot";
              debounce = 750;
              auto_refresh = {
                backward = true;
                forward = true;
              };
            };
          };
          emoji = {
            module = "blink-emoji";
            name = "Emoji";
            enabled.__raw = ''
              function()
                  return vim.tbl_contains({ 'gitcommit', 'markdown', 'text' }, vim.bo.filetype)
              end
            '';
            score_offset = -100;
            # Optional configurations
            opts = { insert = true; };
          };
          # ripgrep = {
          #   async = true;
          #   module = "blink-ripgrep";
          #   name = "Ripgrep";
          #   score_offset = -20;
          #   opts = {
          #     prefix_min_len = 3;
          #     context_size = 5;
          #     max_filesize = "1M";
          #     project_root_marker = ".git";
          #     project_root_fallback = true;
          #     search_casing = "--ignore-case";
          #     additional_rg_options = { };
          #     fallback_to_regex_highlighting = true;
          #     ignore_paths = { };
          #     additional_paths = { };
          #     debug = false;
          #   };
          # };
        };
      };
    };
  };
  keymaps = [{
    mode = "c";
    key = "<C-S-i>";
    action.__raw = "require('blink.cmp').select_prev";
  }];
}
