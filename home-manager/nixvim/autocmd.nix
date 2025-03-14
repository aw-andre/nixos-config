{
  autoGroups = {
    highlight-yank.clear = true;
    write.clear = true;
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
      callback.__raw = "function() vim.cmd('normal =<CMD>e<CR>') end";
      group = "write";
      desc = "Format when writing text";
    }
  ];
}
