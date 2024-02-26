-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = Util.safe_keymap_set
-- quit file
map({ "i", "x", "n", "s" }, "<C-q>", "<cmd>q<cr><esc>", { desc = "Quit file" })
-- end the line with ';'
map({ "i", "n" }, "<C-e>", "<esc>A;<esc>", { desc = "End line with ';'" })
for i = 1, 9 do
  map({ "n" }, "g" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<cr><esc>", { desc = "goto buffer " .. i })
end

map({ "n" }, "<C-q>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "harpoon ui" })
map({ "n" }, "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "harpoon add current file" })
vim.api.nvim_set_keymap(
  "n",
  "<C-w>",
  "<cmd>lua require('telescope.builtin').live_grep({ default_text = vim.fn.expand('<cword>') })<CR>",
  { noremap = true, silent = true, desc = "Live Grep Current Word" }
)

-- 定义一个Lua函数来实现live_grep当前光标下的单词
-- local grep_current_word = function()
--   local word = vim.fn.expand("<cword>") -- 获取当前光标下的单词
--   require("telescope.builtin").live_grep({ default_text = word }) -- 使用Telescope的live_grep来搜索这个单词
-- end
--
-- -- 将这个函数绑定到快捷键<C-q>上，在普通模式下使用
-- vim.api.nvim_set_keymap(
--   "n",
--   "<C-w>",
--   "<cmd>lua grep_current_word()<CR>",
--   { noremap = true, silent = true, desc = "Live Grep Current Word" }
-- )

vim.keymap.set(
  "n",
  "<leader>sx",
  require("telescope.builtin").resume,
  { noremap = true, silent = true, desc = "Resume" }
)

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
