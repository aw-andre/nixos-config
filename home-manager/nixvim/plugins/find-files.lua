function() 
  if vim.fn.argc() == 0 and vim.fn.len(vim.fn.expand('%')) == 0 and stdin == nil
  then
      require('telescope.builtin').find_files()
  end
end
