require("lazy").setup({
    { import = "plugins" },
    { import = "plugins.files" },
    { import = "plugins.formatting" },
    { import = "plugins.graphics" },
    { import = "plugins.utilities" },
}, {
    ui = {
        icons = vim.g.have_nerd_font and {},
    },
})
