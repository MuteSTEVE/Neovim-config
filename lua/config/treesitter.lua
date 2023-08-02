local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

local status_ok, rainbow = pcall(require, "ts-rainbow")
if not status_ok then
	return
end

treesitter.setup({
  ensure_installed = { "bash", "c", "python", "html", "php", "phpdoc", "css", "javascript", "lua", "json", "vim" },
  sync_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    disable = { 'jsx', 'cpp' },
    query = 'rainbow-parens',
    strategy = rainbow.strategy.global,
  },
  autopairs = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = {
      "python", "css"
    }
  }
})
