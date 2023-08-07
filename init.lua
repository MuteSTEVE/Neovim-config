-- plugin configurations
require('config')

require('plugins')
require('options')
require('keymaps')

vim.cmd[[colorscheme onedark]]

vim.cmd("autocmd ColorScheme * highlight Pmenu guibg=NONE")

vim.o.termguicolors = true
