return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        watch_for_changes = true,
        delete_to_trash = true,
        view_options = {
            show_hidden = true
        }
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
}
