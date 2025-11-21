local vim = vim

-- set number
vim.o.nu = true
vim.o.rnu = true

-- Border
vim.o.winborder = "rounded"

-- sign
vim.o.signcolumn = "yes"
vim.opt.colorcolumn = "85"

vim.o.wrap = false

-- dark | batman
vim.o.background = "dark"

-- no mouse in my table
vim.o.mouse = ""

vim.o.ignorecase = true

vim.o.clipboard = "unnamedplus"

vim.o.confirm = true

vim.o.scrolloff = 8

-- Undo
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.swapfile = false

-- Auto complete
vim.cmd [[set completeopt+=fuzzy,menuone,noinsert,popup,preview]]

-- Indent
vim.o.autoindent = true

-- Netwr
-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_liststyle = 3
