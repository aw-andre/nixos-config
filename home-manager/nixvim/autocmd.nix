{
  autoCmd = [
    {
      event = "TextYankPost";
      callback.__raw = "function() vim.highlight.on_yank() end";
      desc = "Highlight when yanking text";
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
