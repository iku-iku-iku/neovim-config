vim.o.number = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.shiftwidth = 4

require("lazy").setup({
    {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
	    require("copilot").setup({})
	end,
    },
    {
	"rebelot/kanagawa.nvim"
    },
    { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
	-- Load the colorscheme here
	vim.cmd.colorscheme 'industry'

	-- You can configure highlights by doing something like
	vim.cmd.hi 'Comment gui=none'
    end,
},
{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
{
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
},
{
    -- amongst your other plugins
    {'akinsho/toggleterm.nvim', version = "*", config = true}
},
{
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
	{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
	{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
	{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
	{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
	{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
},
{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
{'kyazdani42/nvim-tree.lua', dependencies = 'kyazdani42/nvim-tree.lua'},
{ -- Useful plugin to show you pending keybinds.
'folke/which-key.nvim',
event = 'VeryLazy', -- Sets the loading event to 'VeryLazy'
config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
	['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
	['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
	['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
	['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
	['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    }
end,
},
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

require("toggleterm").setup{
    -- 基本配置
    size = function(term)
	if term.direction == "horizontal" then
	    return 15
	elseif term.direction == "vertical" then
	    return vim.o.columns * 0.4
	end
    end,
    open_mapping = [[<c-\>]],  -- 默认的打开快捷键
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = 'vertical',  -- 或者 'horizontal' / 'vertical' / 'tab'
    close_on_exit = true,
    shell = vim.o.shell, -- 使用系统默认shell
}

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
	return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
    vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
    vim.keymap.del('n', 's')

end

require'nvim-tree'.setup {
    on_attach = my_on_attach,
    disable_netrw = true,
    hijack_netrw = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    diagnostics = {
	enable = false,
	icons = {
	    hint = "",
	    info = "",
	    warning = "",
	    error = "",
	},
    },
    update_focused_file = {
	enable = true,
	update_cwd = true,
	ignore_list = {},
    },
    system_open = {
	--cmd = nil,
	args = {},
    },
    filters = {
	dotfiles = false,
	custom = {},
    },
    git = {
	enable = true,
	ignore = true,
	timeout = 500,
    },
    view = {
	width = 30,
	side = 'left',
    }
}

-- 快捷键配置
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- 查找文件
map('n', '<leader><leader>', '<cmd>Telescope find_files<CR>', opts)
-- 查找文字
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
-- 查看当前buffer的大纲
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
-- 查看最近打开的文件
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', opts)
map('n', '<C-s>', '<cmd>w<CR>', opts)
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)

vim.api.nvim_set_keymap('n', 'Z', 'zz', opts)
vim.api.nvim_set_keymap('n', '<leader>s', '/', opts)
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferLineCycleNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>bc', ':BufferLinePickClose<CR>', opts)

vim.g.neovide_fullscreen = true
vim.g.neovide_font = "Consolas:h12"

vim.opt.termguicolors = true

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

require("bufferline").setup{}
vim.env.NVIM_LOG_FILE = "~/.config/nvim/nvim.log"

