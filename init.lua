require('plugins')
require('options')
require('keymaps')
require('cmlsp')
require('code')
require('colors')
require('misc')
require('ui')

vim.cmd[[colorscheme onedark]]

vim.cmd("autocmd ColorScheme * highlight Pmenu guibg=NONE")

vim.o.termguicolors = true
