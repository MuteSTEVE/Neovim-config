local status_ok, hlslens = pcall(require, 'hlslens')
if not status_ok then
  return
end

hlslens.setup()

local kopts = {noremap = true, silent = true}

local map = vim.api.nvim_set_keymap
map('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
map('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
map('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
map('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
map('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
map('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

map('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
