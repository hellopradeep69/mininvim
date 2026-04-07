-- Number
vim.o.number = true
vim.o.rnu = true

vim.o.scrolloff = 8
vim.o.confirm = true

vim.o.path = "**"

vim.opt.grepprg =
'rg --vimgrep --no-messages --smart-case'

-- Casesenstive
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "yes"
vim.o.colorcolumn = "85"
vim.o.cursorline = true

-- Tab behaviour
vim.cmd("filetype plugin indent on")
vim.o.smartindent = true
vim.o.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.o.autocomplete = true
vim.o.complete = ".^5,t^3,w"
-- Undo
vim.cmd("packadd nvim.undotree")
vim.o.backup = false
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.swapfile = false
vim.o.breakindent = true

vim.o.winborder = "rounded"
-- vim.cmd([[set completeopt+=menuone,noselect,popup,fuzzy,noinsert]])
vim.cmd(
    [[set completeopt+=menuone,popup,fuzzy,noinsert]])
vim.o.wildmenu = true

-- vim.o.trim_trailing_whitespace = true

vim.cmd([[
	autocmd CmdlineChanged [:\/\?] call wildtrigger()
	set wildmode=noselect:lastused,full
	set wildoptions=pum ]])

vim.cmd([[
	set findfunc=Find
	func Find(arg, _)
	  if empty(s:filescache)
	    let s:filescache = globpath('.', '**', 1, 1)
	    call filter(s:filescache, '!isdirectory(v:val)')
	    call map(s:filescache, "fnamemodify(v:val, ':.')")
	  endif
	  return a:arg == '' ? s:filescache : matchfuzzy(s:filescache, a:arg)
	endfunc
	let s:filescache = []
	autocmd CmdlineEnter : let s:filescache = [] ]])
