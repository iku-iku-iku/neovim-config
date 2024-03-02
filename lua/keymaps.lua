local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap

-- 查找文件
map("n", "<leader><leader>", "<cmd>Telescope find_files<CR>", opts)
-- 查找文字
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>g", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
-- 查看最近打开的文件
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opts)
-- 文件操作
map("n", "<C-s>", "<cmd>w<CR>", opts)
map("n", "<C-q>", "<cmd>q<CR>", opts)
-- 窗口移动
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

map("n", "Z", "zz", opts)
map("n", "<leader>s", "/", opts)
map("n", "<TAB>", ":BufferLineCycleNext<CR>", opts)
map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opts)
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>`", ":b#<CR>", opts)

-- code
map("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
