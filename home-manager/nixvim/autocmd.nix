{
  autoGroups = {
    highlight-yank.clear = true;
    write.clear = true;
    nohls.clear = true;
  };
  autoCmd = [
    {
      event = "TextYankPost";
      callback.__raw = "function() vim.highlight.on_yank() end";
      group = "highlight-yank";
      desc = "Highlight when yanking text";
    }
    {
      event = "BufWritePre";
      callback.__raw = "function() vim.schedule(function () vim.lsp.buf.format() require('rainbow-delimiters').enable() end) end";
      group = "write";
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
      group = "nohls";
      desc = "Remove search highlight when cursor moves";
    }
  ];
}
