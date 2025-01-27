-- write, compile, and run file
vim.keymap.set("n", "<leader>r", ":20split <CR> :terminal python3 % <CR> i", { desc = "Compile and [R]un file" })
