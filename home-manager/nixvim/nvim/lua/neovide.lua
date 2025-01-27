if vim.g.neovide then
    vim.o.guifont = "SF_Mono,Symbols_Nerd_Font_Mono:h17"
    -- vim.o.guifont = "JetBrainsMonoNL_Nerd_Font:h17"
    vim.keymap.set({ "n", "v" }, "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
    vim.keymap.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
    vim.opt.linespace = 17
    vim.g.neovide_padding_top = 8
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 8
    vim.g.neovide_padding_left = 8
end
