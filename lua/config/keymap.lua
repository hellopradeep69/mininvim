map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>e", "<cmd>Lex<cr>", {})

-- Fuzzy finder builtin
map("n", "<leader>fe", ":find ", {})

-- Grep
map("n", "<leader>/", ":sil grep! | cope <left><left><left><left><left><left><left>", {})

-- Search
map("n", "<leader>sh", ":h ", {})

map("n", "<leader>ii", ":Undotree<cr>", {})

map("n", "<esc>", "<cmd>nohl<cr>", {})
