function()
  if vim.fn.argc() == 0 and vim.fn.len(vim.fn.expand('%')) == 0 and stdin == nil and not (vim.g.started_by_firenvim == true)
  then
      require('telescope.builtin').live_grep()
  end
end
