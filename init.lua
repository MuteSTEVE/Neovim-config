vim.o.termguicolors = true

-- plugin configurations
require('config')

require('plugins')
require('options')
require('keymaps')

vim.cmd[[colorscheme onedark]]

-- vim.cmd("autocmd ColorScheme * highlight Pmenu guibg=NONE")

vim.cmd('autocmd VimEnter * set laststatus=3')
