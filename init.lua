-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.75
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_fullscreen = true
  vim.g.neovide_input_ime = true
  vim.g.neovide_cursor_vfx_mode = "wireframe"
end

-- vim.cmd("colorscheme tokyonight-storm") -- for storm themes
-- vim.cmd("colorscheme tokyonight-day") -- for day theme
-- vim.cmd("colorscheme tokyonight-moon") -- for moon theme
-- vim.cmd("colorscheme tokyonight-night") -- for night themes
require("onedark").load()

-- local dap = require("dap")
-- EXTENSION_PATH = "/home/code4love/PROGRAM/LINUX/MyLinux-0.11/Linux-0.11/debug/extension"
-- dap.adapters.cppdbg = {
--   id = "cppdbg",
--   type = "executable",
--   command = EXTENSION_PATH .. "/debugAdapters/bin/OpenDebugAD7",
-- }
-- dap.configurations.cpp = {
--   {
--     name = "Launch file",
--     type = "cppdbg",
--     request = "launch",
--     program = function()
--       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--     end,
--     cwd = "${workspaceFolder}",
--     stopAtEntry = true,
--   },
--   {
--     name = "Attach to gdbserver :1234",
--     type = "cppdbg",
--     request = "launch",
--     MIMode = "gdb",
--     miDebuggerServerAddress = "localhost:1234",
--     miDebuggerPath = "/usr/bin/gdb",
--     cwd = "${workspaceFolder}",
--     program = function()
--       return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--     end,
--   },
-- }
-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp

require("harpoon").setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 4,
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})
vim.api.nvim_create_user_command("Toggle", function()
  vim.cmd("TSBufToggle highlight")
end, {})

-- require('trouble').setup()
-- require('lualine').setup {
--   options = {
--     icons_enabled = true,
--     theme = 'auto',
--     component_separators = { left = '', right = ''},
--     section_separators = { left = '', right = ''},
--     disabled_filetypes = {},
--     always_divide_middle = true,
--     globalstatus = false,
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', 'diagnostics'},
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   extensions = {}
-- }
--
