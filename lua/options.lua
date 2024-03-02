
vim.g.neovide_fullscreen = true
vim.g.neovide_font = "Consolas:h12"

vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.api.nvim_create_user_command("Toggle", function()
	vim.cmd("TSBufToggle highlight")
end, {})

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shiftwidth = 4
-- set neovim tab with to 4
vim.o.tabstop = 4

