vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set({"n", "v", "x"}, "<leader>y", "\"+y")
-- vim.keymap.set("V", "<leader>y", "\"+y")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })


-- Oil Binds
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>")

-- Telescope Binds
local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)


-- Harpoon Binds
local harpoon = require("harpoon")

harpoon:setup()
vim.keymap.set("n", "<leader>a", function()
  local key = vim.fn.getcharstr()
  local list = harpoon:list()
  local item = list.config.create_list_item(list.config)
  list.items[key] = item
  vim.notify("Bookmarked to: " .. key)
end)

vim.keymap.set("n", "<leader>j", function()
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
