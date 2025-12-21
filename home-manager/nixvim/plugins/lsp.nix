{
  plugins.lsp = {
    enable = true;
    keymaps = {
      extra = [
        {
          mode = "n";
          key = "[d";
          action.__raw =
            "function() vim.diagnostic.jump({count = -1, float = { border = 'rounded' }}) end";
          options.desc = "Go to previous [D]iagnostic message";
        }
        {
          mode = "n";
          key = "]d";
          action.__raw =
            "function() vim.diagnostic.jump({count = 1, float = { border = 'rounded' }}) end";
          options.desc = "Go to next [D]iagnostic message";
        }
        {
          mode = "n";
          key = "<leader>e";
          action.__raw =
            "function() vim.diagnostic.open_float({ border = 'rounded' }) end";
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
          key = "<leader>fs";
          action.__raw = "require('telescope.builtin').lsp_document_symbols";
          options.desc = "[F]ind Document [S]ymbols";
        }
        {
          mode = "n";
          key = "<leader>fS";
          action.__raw =
            "require('telescope.builtin').lsp_dynamic_workspace_symbols";
          options.desc = "[F]ind Dynamic Workspace [S]ymbols";
        }
        {
          mode = "n";
          key = "<leader>r";
          action.__raw = "vim.lsp.buf.rename";
          options.desc = "[R]ename";
        }
        {
          mode = "n";
          key = "<leader>a";
          action.__raw = "vim.lsp.buf.code_action";
          options.desc = "Code [A]ction";
        }
        {
          mode = "n";
          key = "K";
          action.__raw =
            "function() vim.lsp.buf.hover({ border = 'rounded' }) end";
          options.desc = "Hover Documentation";
        }
        {
          mode = "n";
          key = "<leader>h";
          action.__raw =
            "function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end";
          options.desc = "Toggle Inlay [H]ints";
        }
      ];
    };
    luaConfig.post = ''
      local lsp_pos_stack = {}

      vim.keymap.set("n", "gd", function()
        -- save current position (file + line + col)
        table.insert(lsp_pos_stack, { vim.fn.expand("%:p"), vim.fn.line("."), vim.fn.col(".") })
        require('telescope.builtin').lsp_definitions()
      end, { desc = "[G]oto [D]efinition" })

      vim.keymap.set("n", "gD", function()
        -- save current position (file + line + col)
        table.insert(lsp_pos_stack, { vim.fn.expand("%:p"), vim.fn.line("."), vim.fn.col(".") })
        vim.lsp.buf.declaration()
      end, { desc = "[G]oto [D]eclaration" })

      vim.keymap.set("n", "gr", function()
        -- save current position (file + line + col)
        table.insert(lsp_pos_stack, { vim.fn.expand("%:p"), vim.fn.line("."), vim.fn.col(".") })
        require('telescope.builtin').lsp_references()
      end, { desc = "[G]oto [R]eferences" })

      vim.keymap.set("n", "gI", function()
        -- save current position (file + line + col)
        table.insert(lsp_pos_stack, { vim.fn.expand("%:p"), vim.fn.line("."), vim.fn.col(".") })
        require('telescope.builtin').lsp_implementations()
      end, { desc = "[G]oto [I]mplementation" })

      vim.keymap.set("n", "gy", function()
        -- save current position (file + line + col)
        table.insert(lsp_pos_stack, { vim.fn.expand("%:p"), vim.fn.line("."), vim.fn.col(".") })
        require('telescope.builtin').lsp_type_definitions()
      end, { desc = "[G]oto T[y]pe" })

      vim.keymap.set("n", "gb", function()
        if #lsp_pos_stack > 0 then
          local pos = table.remove(lsp_pos_stack)
          vim.cmd("edit " .. pos[1])
          vim.api.nvim_win_set_cursor(0, { pos[2], pos[3] - 1 })
        else
          print("No previous LSP location")
        end
      end)

      vim.keymap.del("n", "gra")
      vim.keymap.del("n", "grn")
      vim.keymap.del("n", "gri")
      vim.keymap.del("n", "grr")
      vim.keymap.del("n", "grt")
    '';
  };
}
