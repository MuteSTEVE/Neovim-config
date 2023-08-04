-- plugin configurations
require('config')
require('config.ui.harpoon')

require('plugins')
require('options')
require('keymaps')

vim.cmd[[colorscheme onedark]]

vim.cmd("autocmd ColorScheme * highlight Pmenu guibg=NONE")
vim.cmd("source ~/.config/nvim/lua/config/ui/harpoon.lua")

vim.o.termguicolors = true
