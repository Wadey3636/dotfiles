local map = vim.keymap.set

    
map("n", "<Esc>", ":nohlsearch<CR>")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map({"n", "v", "x"}, "<leader>y", "\"+y")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("i", "jk", "<Esc>", { noremap = true, silent = true })


-- Oil Binds
map("n", "<leader>e", "<cmd>Oil<cr>")

--Fzf Lua binds
local fzf = require("fzf-lua")
map("n", "<leader>pf", function () fzf.files() end)
map("n", "<leader>pg", function () fzf.grep_visual() end)
map("n", "<leader>pp", function () fzf.complete_path() end)
map("n", "<leader>pc", function () fzf.complete_file() end)
map("n", "<leader>pb", function () fzf.dap_breakpoints() end)

--Lsp binds

map("n", "gd", function() fzf.lsp_definitions({ jump1 = true }) end)
map("n", "gD", function() fzf.lsp_declarations({ jump1 = true }) end)
map("n", "gt", function() fzf.lsp_typedefs({ jump1 = true }) end)
map("n", "gr", function() fzf.lsp_references({ jump1 = true }) end)

local renamer = require("config.renamer")
map("n", "<leader>r", renamer)
map("n", "ga", function() fzf.lsp_code_actions() end)

-- Harpoon Binds
local harpoon = require("harpoon")

harpoon:setup()
map("n", "<leader>a", function()
  local key = vim.fn.getcharstr()
  local list = harpoon:list()
  local item = list.config.create_list_item(list.config)
  list.items[key] = item
  vim.notify("Bookmarked to: " .. key)
end)

map("n", "<leader>j", function()
  local key = vim.fn.getcharstr()
  local list = harpoon:list()
  local item = list.items[key]
  if item then
    list.config.select(item, list.config, nil)
    vim.notify("Jumped to: " .. key)
  else
    vim.notify("No bookmark at: " .. key, vim.log.levels.WARN)
  end
end)
