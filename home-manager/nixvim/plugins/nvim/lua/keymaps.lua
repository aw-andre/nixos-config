-- [[ Keymaps ]]
-- diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- window switching keymaps
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- terminal keymaps
vim.keymap.set("t", "<C-Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- word wrap
vim.keymap.set({ 'n', "v" }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ 'n', "v" }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- join lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lower line" })
vim.keymap.set("v", "J", "<CMD>m '>+1<CR>gv=gv", { desc = "Join lower line" })
vim.keymap.set("v", "K", "<CMD>m '>-2<CR>gv=gv", { desc = "Join upper line" })

-- jumping
-- vim.keymap.set("n", "<C-f>", "<C-f>zz")
-- vim.keymap.set("n", "<C-b>", "<C-b>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- -- paste without yanking
-- vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste without yanking" })
--
-- -- true delete
-- vim.keymap.set("n", "<leader>d", "\"_d", { desc = "Delete without yanking" })
-- vim.keymap.set("n", "<leader>D", "\"_D", { desc = "Delete without yanking" })

-- quickfix
vim.keymap.set("n", "<leader>J", "<CMD>cnext<CR>zz", { desc = "Go to next fix in quickfix list" })
vim.keymap.set("n", "<leader>K", "<CMD>cprev<CR>zz", { desc = "Go to previous fix in quickfix list" })
vim.keymap.set("n", "<leader>j", "<CMD>lnext<CR>zz", { desc = "Go to next fix in window" })
vim.keymap.set("n", "<leader>k", "<CMD>lprev<CR>zz", { desc = "Go to previous fix in window" })

-- quick substitute
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
--     { desc = "Quick substitute word" })
-- vim.keymap.set("v", "<leader>s", [[y:%s/\<<C-r>"\>/<C-r>"/gI<Left><Left><Left>]], { desc = "Quick substitute selection" })

-- nohlsearch
-- vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
