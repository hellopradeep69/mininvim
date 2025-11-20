return {
	"neovim/nvim-lspconfig",
	dependencies = {
	{ "mason-org/mason.nvim", opts = {} }, },


	-- diagnostic config
        vim.diagnostic.config({ virtual_text = true })

}
