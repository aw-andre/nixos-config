-- [[ General ]]
-- leader key: <space>
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- nerd font
vim.g.have_nerd_font = true

-- [[ Setting Options ]]
require("options")

-- [[ Keymaps ]]
require("keymaps")

-- [[ Autocommands ]]
require("autocmd")

-- [[ `lazy.nvim` Installation ]]
require("lazy-bootstrap")

-- [[ `lazy.nvim` Plugin Manager ]]
require("lazy-plugins")

-- [[ Neovide ]]
require("neovide")
