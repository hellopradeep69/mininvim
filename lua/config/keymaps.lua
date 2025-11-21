local vim = vim
local opts = { noremap = true, silent = true }

-- Better esc
vim.keymap.set("i", "jj", "<esc>", {})

-- Ex
vim.keymap.set("n", "<leader>e", "<cmd>Lex<cr>", {})

-- Ex | oil
-- vim.keymap.set("n", "<leader>E", "<cmd>Oil<cr>", {})

-- Toggle
vim.keymap.set("n", "<leader>o", "<c-w>w", {})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Buffer Delete
vim.keymap.set("n", "<leader>dd", "<cmd>bd<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bd", ":ls<cr>:bd ", { desc = "Delete buffer" })

-- Lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Delete buffer" })

-- Session
-- Add session
vim.keymap.set("n", "<leader>sa", ":mks! ~/Sessions.vim/", { desc = "Add session" })

-- view session
vim.keymap.set("n", "<leader>sl", ":!ls ~/Sessions.vim/ | nl<cr>:so ~/Sessions.vim/", { desc = "View session" })

-- Del Sessions
vim.keymap.set("n", "<leader>sx", ":!ls -1 ~/Sessions.vim/<cr>:!trash ~/Sessions.vim/", { desc = "Del session" })

-- Break point
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")
vim.keymap.set("n", "d", '"_d', opts)
vim.keymap.set("n", "dd", '"_dd', opts)
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("v", "d", '"_d', opts)
vim.keymap.set("v", "x", '"_x', opts)

-- better up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- vim.keymap.set("n", "<ESC>", ":nohlsearch<CR>", { desc = "clear search highlight" })
vim.keymap.set("n", "<ESC>", " <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR> ",
	{ desc = "clear search highlight" })

-- Buffer | idk  gotta find new way
vim.keymap.set("n", "<leader>bl", "<cmd>ls<cr>", opts)

-- default find
vim.keymap.set("n", "<leader>fo", ":find **/", { desc = "Find" })

-- Quick term
vim.keymap.set("n", "<c-t>", ":!", { desc = "Term" })
