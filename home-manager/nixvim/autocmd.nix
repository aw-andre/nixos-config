{
  autoCmd = [
    {
      event = "TextYankPost";
      callback.__raw = "function() vim.highlight.on_yank() end";
      desc = "Highlight when yanking text";
    }
    {
      event = "BufWritePre";
      callback.__raw = "function () vim.lsp.buf.format() end";
      desc = "Format when writing text";
    }
    {
      event = [ "TextChanged" "TextChangedI" "TextChangedP" "TextChangedT" ];
      callback.__raw = "function () require('rainbow-delimiters').enable() end";
      desc = "Color delimiters";
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
