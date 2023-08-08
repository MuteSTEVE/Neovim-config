local lualine_ok, lualine = pcall(require, 'lualine')
if not lualine_ok then
	return
end

local navic_ok, navic = pcall(require, 'nvim-navic')
if not navic_ok then
  return
end

local noice_ok, noice = pcall(require, 'noice')
if not noice_ok then
 return
end

lualine.setup {
  options = {
    icons_enabled = true,
    -- theme = 'material-stealth',
    -- theme = 'fluoromachine',
    -- theme = 'tokyonight',
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      'packer',
      'alpha',
      'NvimTree',
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
    transparent = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {'filename',
        function()
          return navic.get_location()
        end,
        cond = function()
          return navic.is_available()
        end
      }
    },
    lualine_x = {
      -- {
      --   noice.api.status.message.get_hl,
      --   cond = noice.api.status.message.has,
      -- },
      -- {
      --   noice.api.status.command.get,
      --   cond = noice.api.status.command.has,
      --   color = { fg = "#ff9e64" },
      -- },
      -- {
      --   noice.api.status.mode.get,
      --   cond = noice.api.status.mode.has,
      --   color = { fg = "#ff9e64" },
      -- },
      {
        noice.api.status.search.get,
        cond = noice.api.status.search.has,
        color = { fg = "#ff9e64" },
      },
      'encoding',
      'fileformat',
      'filetype',
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
