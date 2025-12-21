{
  plugins = {
    blink-cmp-dictionary.enable = true;
    blink-cmp-git.enable = true;
    blink-compat.enable = true;
    blink-copilot.enable = true;
    blink-emoji.enable = true;
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;

      settings = {
        enabled.__raw = ''
          function()
            return vim.bo.filetype ~= "copilot-chat"
          end
        '';

        completion = {
          accept.auto_brackets.enabled = false;
          menu = {
            border = "rounded";
            scrollbar = false;
          };
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 0;
            window.border = "rounded";
          };
        };

        signature = {
          enabled = true;
          window.border = "rounded";
        };

        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
            "dictionary"
            "git"
            "copilot"
            "emoji"
            "dadbod"
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
              opts.git_centers.git_hub = { };
            };

            copilot = {
              async = true;
              module = "blink-copilot";
              name = "Copilot";
              score_offset = -10;
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
              opts.insert = true;
            };

            dadbod = {
              name = "Dadbod";
              module = "vim_dadbod_completion.blink";
              enabled.__raw = ''
                function()
                    return vim.tbl_contains({ 'sql', 'mysql', 'plsql' }, vim.bo.filetype)
                end
              '';
              score_offset = 10;
            };
          };
        };
      };
    };
  };
}
