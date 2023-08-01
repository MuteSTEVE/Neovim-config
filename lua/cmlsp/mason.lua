local servers = {
  'html',
  'cssls',
  'cssmodules_ls',
  'unocss',
  'phpactor',
  'intelephense',
  'tsserver',
  'pylsp',
  'lua_ls',
  'vimls'
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

local status_ok, mason = pcall(require, 'mason')
if not status_ok then
  return
end

local status_ok, masonlspconfig = pcall(require, 'mason-lspconfig')
if not status_ok then
  return
end

mason.setup(settings)
masonlspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})
