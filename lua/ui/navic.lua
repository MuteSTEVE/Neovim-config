local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end
}

navic.setup {
  icons = {
    File = ' ',
    Module = ' ',
    Namespace = ' ',
    Package = ' ',
    Class = ' ',
    Method = ' ',
    Property = ' ',
    Field = ' ',
    Constructor = ' ',
    Enum = ' ',
    Interface = ' ',
    Function = ' ',
    Variable = ' ',
    Constant = ' ',
    String = ' ',
    Number = ' ',
    Boolean = ' ',
    Array = ' ',
    Object = ' ',
    Key = ' ',
    Null = ' ',
    EnumMember = ' ',
    Struct = ' ',
    Event = ' ',
    Operator = ' ',
    TypeParameter = ' '
  },
  lsp = {
    auto_attach = false,
    preference = nil,
  },
  highlight = false,
  separator = " > ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true,
  click = false
}
