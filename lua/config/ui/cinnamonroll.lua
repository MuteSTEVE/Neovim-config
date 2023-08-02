local status_ok, cinnamon = pcall(require, 'cinnamon')
if not status_ok then
  return
end

cinnamon.setup {
  default_keymaps = true,
  extra_keymaps = false,
  extended_keymaps = false,
  override_keymaps = false,
  always_scroll = false,
  centered = true,
  disabled = false,
  default_delay = 5,
  hide_cursor = false,
  horizontal_scroll = true,
  max_length = -1,
  scroll_limit = 150,
}

-- DEFAULT_KEYMAPS:

local map = vim.keymap.set
-- Half-window movements:
map({ 'n', 'x' }, '<C-u>', "<Cmd>lua Scroll('<C-u>', 1, 1)<CR>")
map({ 'n', 'x' }, '<C-d>', "<Cmd>lua Scroll('<C-d>', 1, 1)<CR>")

-- Page movements:
-- map({ 'n', 'x' }, '<C-b>', "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
-- map({ 'n', 'x' }, '<C-f>', "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")
-- map({ 'n', 'x' }, '<PageUp>', "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
-- map({ 'n', 'x' }, '<PageDown>', "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")

-- EXTRA_KEYMAPS:

-- Start/end of file and line number movements:
map({ 'n', 'x' }, 'gg', "<Cmd>lua Scroll('gg')<CR>")
map({ 'n', 'x' }, 'G', "<Cmd>lua Scroll('G', 0, 1)<CR>")

-- Start/end of line:
map({ 'n', 'x' }, '0', "<Cmd>lua Scroll('0')<CR>")
map({ 'n', 'x' }, '^', "<Cmd>lua Scroll('^')<CR>")
map({ 'n', 'x' }, '$', "<Cmd>lua Scroll('$', 0, 1)<CR>")

-- Paragraph movements:
map({ 'n', 'x' }, '{', "<Cmd>lua Scroll('{')<CR>")
map({ 'n', 'x' }, '}', "<Cmd>lua Scroll('}')<CR>")

-- Previous/next search result:
map('n', 'n', "<Cmd>lua Scroll('n', 1)<CR>")
map('n', 'N', "<Cmd>lua Scroll('N', 1)<CR>")
map('n', '*', "<Cmd>lua Scroll('*', 1)<CR>")
map('n', '#', "<Cmd>lua Scroll('#', 1)<CR>")
map('n', 'g*', "<Cmd>lua Scroll('g*', 1)<CR>")
map('n', 'g#', "<Cmd>lua Scroll('g#', 1)<CR>")

-- Previous/next cursor location:
map('n', '<C-o>', "<Cmd>lua Scroll('<C-o>', 1)<CR>")
map('n', '<C-i>', "<Cmd>lua Scroll('1<C-i>', 1)<CR>")

-- Screen scrolling:
map('n', 'zz', "<Cmd>lua Scroll('zz', 0, 1)<CR>")
map('n', 'zt', "<Cmd>lua Scroll('zt', 0, 1)<CR>")
map('n', 'zb', "<Cmd>lua Scroll('zb', 0, 1)<CR>")
map('n', 'z.', "<Cmd>lua Scroll('z.', 0, 1)<CR>")
map('n', 'z<CR>', "<Cmd>lua Scroll('zt^', 0, 1)<CR>")
map('n', 'z-', "<Cmd>lua Scroll('z-', 0, 1)<CR>")
map('n', 'z^', "<Cmd>lua Scroll('z^', 0, 1)<CR>")
map('n', 'z+', "<Cmd>lua Scroll('z+', 0, 1)<CR>")
map('n', '<C-y>', "<Cmd>lua Scroll('<C-y>', 0, 1)<CR>")
map('n', '<C-e>', "<Cmd>lua Scroll('<C-e>', 0, 1)<CR>")

-- Horizontal screen scrolling:
map('n', 'zH', "<Cmd>lua Scroll('zH')<CR>")
map('n', 'zL', "<Cmd>lua Scroll('zL')<CR>")
map('n', 'zs', "<Cmd>lua Scroll('zs')<CR>")
map('n', 'ze', "<Cmd>lua Scroll('ze')<CR>")
map('n', 'zh', "<Cmd>lua Scroll('zh', 0, 1)<CR>")
map('n', 'zl', "<Cmd>lua Scroll('zl', 0, 1)<CR>")

-- EXTENDED_KEYMAPS:

-- Up/down movements:
map({ 'n', 'x' }, 'k', "<Cmd>lua Scroll('k', 0, 1)<CR>")
map({ 'n', 'x' }, 'j', "<Cmd>lua Scroll('j', 0, 1)<CR>")
map({ 'n', 'x' }, '<Up>', "<Cmd>lua Scroll('k', 0, 1)<CR>")
map({ 'n', 'x' }, '<Down>', "<Cmd>lua Scroll('j', 0, 1)<CR>")

-- Left/right movements:
map({ 'n', 'x' }, 'h', "<Cmd>lua Scroll('h', 0, 1)<CR>")
map({ 'n', 'x' }, 'l', "<Cmd>lua Scroll('l', 0, 1)<CR>")
map({ 'n', 'x' }, '<Left>', "<Cmd>lua Scroll('h', 0, 1)<CR>")
map({ 'n', 'x' }, '<Right>', "<Cmd>lua Scroll('l', 0, 1)<CR>")

-- SCROLL_WHEEL_KEYMAPS:

map({ 'n', 'x' }, '<ScrollWheelUp>', "<Cmd>lua Scroll('<ScrollWheelUp>')<CR>")
map({ 'n', 'x' }, '<ScrollWheelDown>', "<Cmd>lua Scroll('<ScrollWheelDown>')<CR>")

-- LSP_KEYMAPS:

-- LSP go-to-definition:
map('n', 'gd', "<Cmd>lua Scroll('definition')<CR>")

-- LSP go-to-declaration:
map('n', 'gD', "<Cmd>lua Scroll('declaration')<CR>")
