{
  autoCmd = [
    {
      event = "TextYankPost";
      callback.__raw = "function() vim.highlight.on_yank() end";
      desc = "Highlight when yanking text";
    }
    {
      event = "InsertEnter";
      callback.__raw = ''
        function()
          vim.schedule(function() vim.cmd("nohlsearch") end)
        end
      '';
      desc = "Set nohls on insert enter";
    }
    {
      event = "CursorMoved";
      callback.__raw = ''
        function()
          local view, rpos = vim.fn.winsaveview(), vim.fn.getpos(".")
          vim.cmd(string.format("silent! keepjumps go%s",
            (vim.fn.line2byte(view.lnum) + view.col + 1 - (vim.v.searchforward == 1 and 2 or 0))))
          local ok, _ = pcall(vim.cmd, "silent! keepjumps norm! n")
          local insearch = ok and (function()
            local npos = vim.fn.getpos(".")
            return npos[2] == rpos[2] and npos[3] == rpos[3]
          end)()
          -- restore original view and position
          vim.fn.winrestview(view)
          if not insearch then
            vim.schedule(function() vim.cmd("nohlsearch") end)
          end
        end
      '';
      desc = "Set nohls on cursor move";
    }
  ];
}
