-- [[ Setting Options ]]
-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- mouse mode
vim.opt.mouse = "a"

-- disable showmode
vim.opt.showmode = false

-- sync Neovim and OS clipboards
vim.opt.clipboard = "unnamedplus"

-- enable break indent
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- case-insensitive searching
-- unless \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- update time
vim.opt.updatetime = 250

-- mapped sequence and which-key popup wait time
vim.opt.timeoutlen = 300

-- configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- whitespace character display
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- preview substitutions live
vim.opt.inccommand = "split"

-- show which line cursor is on
vim.opt.cursorline = true

-- lines to keep above and below cursor
vim.opt.scrolloff = 10

-- highlight search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- tabs
vim.opt.tabstop = 4      -- A TAB character looks like 4 spaces
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 4  -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 4   -- Number of spaces inserted when indenting

-- textwidth
-- vim.opt.textwidth = 80

-- autochdir
-- vim.opt.autochdir = true;

-- line wrapping
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
vim.opt.linebreak = true

-- obsidian
-- vim.opt.conceallevel = 1
