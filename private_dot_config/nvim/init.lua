vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("plugins.load_plugins")

require("config.binds")
require("config.autopairs_configuration")

require('vim._core.ui2').enable({})


vim.opt.termguicolors = true

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("config-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- local treesitter = require("treesitter.treesitter_setup")
-- treesitter.setup()

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.signcolumn = 'yes'
vim.o.foldenable = false
vim.o.wrap = false
vim.wo.relativenumber = true
