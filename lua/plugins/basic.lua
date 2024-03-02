return {
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				-- 基本配置
				size = function(term)
					if term.direction == "horizontal" then
						return 15
					elseif term.direction == "vertical" then
						return vim.o.columns * 0.4
					end
				end,
				open_mapping = [[<c-\>]], -- 默认的打开快捷键
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "vertical", -- 或者 'horizontal' / 'vertical' / 'tab'
				close_on_exit = true,
				shell = vim.o.shell, -- 使用系统默认shell
			})
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = "kyazdani42/nvim-tree.lua",
		config = function()
			local function my_on_attach(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- custom mappings
				vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
				vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
			end

			require("nvim-tree").setup({
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
					side = "left",
				},
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
			{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
			{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>",          desc = "Delete other buffers" },
			{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete buffers to the right" },
			{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete buffers to the left" },
			{ "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
			{ "<S-l>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
			{ "[b",         "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev buffer" },
			{ "]b",         "<cmd>BufferLineCycleNext<cr>",            desc = "Next buffer" },
		},
		opts = {
			options = {
				-- stylua: ignore
				-- close_command = function(n) require("mini.bufremove").delete(n, false) end,
				-- stylua: ignore
				-- right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				-- diagnostics_indicator = function(_, _, diag)
				-- 	local icons = require("lazyvim.config").icons.diagnostics
				-- 	local ret = (diag.error and icons.Error .. diag.error .. " " or "")
				-- 		.. (diag.warning and icons.Warn .. diag.warning or "")
				-- 	return vim.trim(ret)
				-- end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
			-- Fix bufferline when restoring a session
			vim.api.nvim_create_autocmd("BufAdd", {
				callback = function()
					vim.schedule(function()
						-- pcall(nvim_bufferline)
					end)
				end,
			})
		end,
	},
}
