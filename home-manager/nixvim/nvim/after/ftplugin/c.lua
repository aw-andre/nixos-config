-- write, compile, and run file
vim.keymap.set("n", "<leader>r", "<CMD>20split<CR><CMD>terminal gcc % && ./a.out && rm ./a.out<CR>i",
	{ desc = "Compile and [R]un file" })

vim.opt.shiftwidth = 2
