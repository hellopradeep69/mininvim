-- Replacement for harpoon
local vim = vim

vim.keymap.set("n", "<leader>H", function()
	vim.cmd("$argadd %")
	vim.cmd("argdedup")
end)

vim.keymap.set("n", "<leader>h", function()
	vim.cmd.args()
end)

vim.keymap.set("n", "<leader>bd", ":ls<cr>:bd ", { desc = "Delete buffer" })

vim.keymap.set("n", "<C-h>", function()
	vim.cmd("silent! 1argument")
end)

vim.keymap.set("n", "<C-j>", function()
	vim.cmd("silent! 2argument")
end)

vim.keymap.set("n", "<C-k>", function()
	vim.cmd("silent! 3argument")
end)

vim.keymap.set("n", "<C-l>", function()
	vim.cmd("silent! 4argument")
end)

-- vim.keymap.set("n", "L", "<cmd>n<cr>", {})
-- vim.keymap.set("n", "H", "<cmd>prev<cr>", {})


vim.keymap.set("n", "L", function()
	vim.cmd("next")
	vim.cmd("args")
end, {})

vim.keymap.set("n", "H", function()
	vim.cmd("prev")
	vim.cmd("args")
end, {})
