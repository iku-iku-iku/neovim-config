
require("lazy").setup({
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	}
})
require'nvim-treesitter.configs'.setup {
	-- 启用代码高亮模块
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	-- 启用增量选择模块
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	-- 启用基于语法的代码折叠
	ensure_installed = "all", -- 自动安装所有支持的语言
	fold = {
		enable = true,
	},
	-- 其他模块和配置...
}

vim.api.nvim_create_user_command(
'Toggle',
function()
	vim.cmd('TSBufToggle highlight')
end,
{}
)

require('telescope').setup{}

-- 快捷键配置
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- 查找文件
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
-- 查找文字
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
-- 查看当前buffer的大纲
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
-- 查看最近打开的文件
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', opts)
