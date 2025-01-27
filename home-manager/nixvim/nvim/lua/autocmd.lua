-- [[ Autocommands ]]
-- highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- remove hlsearch after moving
-- vim.on_key(function(char)
--     if vim.fn.mode() == "n" then
--         local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/", "z", "v" }, vim.fn.keytrans(char))
--         if vim.opt.hlsearch:get() ~= new_hlsearch then vim.opt.hlsearch = new_hlsearch end
--     end
-- end, vim.api.nvim_create_namespace "auto_hlsearch")

-- enter in terminal mode
-- vim.api.nvim_create_autocmd("VimEnter", {
--   desc = "Launch in terminal mode",
--   group = vim.api.nvim_create_augroup("terminal-enter", { clear = true }),
--   command = "terminal"
-- })

-- Open binary files
-- vim.api.nvim_create_autocmd("BufReadCmd", {
--     pattern = { "*.pdf", "*.epub" },
--     callback = function()
--         filename = vim.api.nvim_buf_get_name(0)
--         vim.ui.open(filename)
--         vim.cmd("bd")
--     end
-- })
--
-- vim.api.nvim_create_autocmd("BufReadCmd", {
--     pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
--     callback = function()
--         local filename = vim.fn.shellescape(vim.api.nvim_buf_get_name(0))
--         vim.cmd("silent !preview " .. filename .. " &")
--         vim.cmd("let tobedeleted = bufnr('%') | b# | exe \"bd! \" . tobedeleted")
--     end
-- })

local api = vim.api

api.nvim_command("autocmd TermOpen * startinsert")               -- starts in insert mode
api.nvim_command("autocmd TermOpen * setlocal nonumber")         -- no numbers
api.nvim_command("autocmd TermOpen * setlocal norelativenumber") -- no numbers
api.nvim_command("autocmd TermEnter * setlocal signcolumn=no")   -- no sign column
