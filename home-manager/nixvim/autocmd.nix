{
  autoCmd = [
    {
      event = "TextYankPost";
      callback.__raw = "function() vim.highlight.on_yank() end";
      desc = "Highlight when yanking text";
    }
    {
      event = "BufWritePre";
      callback.__raw = "function() vim.schedule(function () vim.lsp.buf.format() require('rainbow-delimiters').enable() end) end";
      desc = "Format when writing text";
    }
    {
      event = "CursorMoved";
      callback.__raw = ''
        function ()
          if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
            vim.schedule(function () vim.cmd.nohlsearch() end)
          end
        end
      '';
      desc = "Remove search highlight when cursor moves";
    }
  ];
}
