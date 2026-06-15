-- Set <space> as the leader key
vim.g.mapleader = " "

require("vim._core.ui2").enable()

-- OPTIONS
vim.o.number = true
vim.o.relativenumber = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.list = true
vim.o.confirm = true
vim.o.colorcolumn = "85"
vim.o.cursorline = true
vim.o.signcolumn = "yes:1"

-- Border
vim.o.winborder = "rounded"

vim.o.fillchars = "eob: "

vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.grepprg = "rg --no-message --vimgrep --smart-case --ignore-case"

-- Indent
vim.cmd("filetype plugin indent on")
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.tabstop = 4

-- undo level
vim.o.swapfile = false
vim.o.undolevels = 10000
vim.o.undofile = true

vim.opt.path:append({ "**" })
vim.diagnostic.config({ virtual_text = true })

-- KEYMAPS
vim.keymap.set("n", "<leader>fe", "q:i:fin ", {})
vim.keymap.set("n", "<leader>/", ":Ggrep | copen<left><left><left><left><left><left><left>", {})
vim.keymap.set("n", "<leader>e", "<cmd>Lex<cr>", {})

-- USERCOMMAND
vim.api.nvim_create_user_command("F", function()
	require("oil").toggle_float()
end, {})

-- AUTOCOMMANDS (EVENT HANDLERS)
-- Highlight when yanking (copying) text.
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

-- DISALBE COMMENTING NEXT LINE
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})

-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.cmd('normal! g`"zz')
		end
	end,
})

-- Trailing
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.setpos(".", save_cursor)
	end,
})

-- Treesitter start
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

-- PLUGINS
vim.cmd("packadd! nvim.undotree")
vim.cmd("packadd! nvim.difftool")

vim.pack.add({
	{ src = "https://gitlab.com/motaz-shokry/gruvbox.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/tpope/vim-fugitive" },
})

require("gruvbox").setup({
	styles = {
		transparency = true,
	},
	highlight_groups = {
		LspReferenceRead = { bg = "bg2", underline = false },
		LspReferenceText = { bg = "bg_second", underline = false },
		LspReferenceWrite = { bg = "bg_second", underline = false },
		LspSignatureActiveParameter = { fg = "bg_main", bg = "green_lite", underline = false },
		LspReferenceTarget = { fg = "fg1", bg = "bg_second", underline = false },
	},
})

vim.cmd("colorscheme gruvbox")

require("mason").setup()
require("mason-lspconfig").setup()

vim.diagnostic.config({ virtual_text = true })

require("blink.cmp").setup({
	keymap = { preset = "default" },

	completion = {
		documentation = {
			auto_show = true,
		},
		menu = {
			scrollbar = false,
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	signature = { enabled = true },
	fuzzy = { implementation = "prefer_rust_with_warning" },
})

require("nvim-treesitter").install({
	"bash",
	"c",
	"cpp",
	"diff",
	"lua",
	"luadoc",
	"luap",
	"make",
	"python",
	"vim",
	"vimdoc",
})

require("oil").setup({
	default_file_explorer = false,
	columns = {
		"size",
	},
	delete_to_trash = true,
	keymaps = {
		["P"] = "actions.preview",
		["H"] = { "actions.parent", mode = "n" },
	},
})
