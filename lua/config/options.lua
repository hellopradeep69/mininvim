local vim = vim

-- set number
vim.o.nu = true
vim.o.rnu = true

-- sign
vim.o.signcolumn = "yes"
vim.opt.colorcolumn = "85"

-- dark | batman
vim.o.background = "dark"

-- no mouse in my table
vim.o.mouse = ""

vim.o.ignorecase = true

vim.o.clipboard = "unnamedplus"

vim.o.confirm = true

vim.o.scrolloff = 8


-- Auto complete
vim.cmd [[set completeopt+=fuzzy,menuone,noinsert,popup,preview]]
