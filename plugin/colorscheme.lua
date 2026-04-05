vim.pack.add({ "https://gitlab.com/motaz-shokry/gruvbox.nvim" })

require("gruvbox").setup({
    styles = {
        transparency = true,
    }
})

vim.cmd("colorscheme gruvbox")
