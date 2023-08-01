local status_ok, material = pcall(require, 'material')
if not status_ok then
  return
end

material.setup({
  lualine = {
    transparent = true,
  },
})

vim.g.material_style = "deep ocean"
local colorscheme = "material"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
