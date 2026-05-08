vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("config-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = false
vim.o.smartindent = false
vim.o.signcolumn = 'yes'
vim.o.wrap = false
vim.wo.relativenumber = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()"

require("plugins.load_plugins")

require("config.binds")
require("config.autopairs_configuration")

require('vim._core.ui2').enable({})


