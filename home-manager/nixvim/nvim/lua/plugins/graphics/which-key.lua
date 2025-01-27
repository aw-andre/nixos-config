return {
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
            spec = {
                { '<leader>f', group = '[F]ind' },
                { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
                { 's',         group = '[S]urround' }
            },
            sort = { "alphanum" },
        },
    },

    vim.keymap.set("n", "<leader>?",
        function()
            require("which-key").show({ global = false })
        end,
        { desc = "Buffer Local Keymaps (which-key)" }),
}
