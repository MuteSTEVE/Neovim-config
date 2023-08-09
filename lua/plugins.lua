local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)

  use 'wbthomason/packer.nvim'   -- Packer can manage itself

  -- colorscheme
  use {
		'navarasu/onedark.nvim',
		config = require('config.colorscheme.onedark'),
    --vim.cmd('colorscheme onedark')
	}

  use {
    'kkharji/lspsaga.nvim',
    config = require('config.lsp.lspsaga')
  }

  use{
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    config = require('config.lsp.mason')
  }

  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'rafamadriz/friendly-snippets',
    'onsails/lspkind.nvim',
    'dsznajder/vscode-es7-javascript-react-snippets',
    run = 'yarn install --frozen-lockfile && yarn compile',
    config = require('config.lsp.cmp')
  }

  use {
    'nvim-lualine/lualine.nvim',
    config = require('config.ui.lualine')
  }

  use {
    'nvim-tree/nvim-tree.lua',
    config = require('config.ui.nvimtree')
  }

  use {
    'akinsho/bufferline.nvim',
    config = require('config.ui.bufferline')
  }

  use {
    'utilyre/barbecue.nvim',
    config = require('config.ui.barbecue')
  }

  use {
    'SmiteshP/nvim-navic',
    config = require('config.ui.navic')
  }

  -- requires web-devicons
  use {
    'kyazdani42/nvim-web-devicons',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = 'BufWinEnter',
    config = require('config.treesitter')
  }

  use {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    after = 'nvim-treesitter',
  }

  use {
    'HiPhish/nvim-ts-rainbow2',
    after = 'nvim-treesitter',
  }

  -- treesitter
  use {
    'windwp/nvim-autopairs',
    config = require('config.autopairs')
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-lua/plenary.nvim',
    config = require('config.ui.telescope'),
  }

  use {
    'neovim/nvim-lspconfig',
    config = require('config.lsp.lspconfig')
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = require('config.colorizer'),
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = require('config.ui.gitsigns')
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = require('config.ui.indentblankline'),
  }

  use {
    'akinsho/toggleterm.nvim',
    config = require('config.ui.toggleterm')
  }

  use {
    'terrortylor/nvim-comment',
    config = require('config.comment')
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = require('config.nulls')
  }

  use {
    'folke/which-key.nvim',
    config = require('config.ui.whichkey')
  }

  -- Single use
  use {
    'lewis6991/impatient.nvim',
    config = require('config.impatient')
  }

  use {
    'kylechui/nvim-surround',
    config = require('config.surround')
  }

  use {
    'folke/zen-mode.nvim',
    config = require('config.ui.zen')
  }

  use {
    'folke/twilight.nvim',
    config = require('config.ui.twilight')
  }

  use {
    'rcarriga/nvim-notify',
    config = require('config.ui.notify')
  }

  -- noice nvim
  use {
    'folke/noice.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
    },
    config = require('config.ui.noice')
  }

  -- nvim illuminate
  use{
    'RRethy/vim-illuminate',
    config = require('config.illuminate')
  }

  -- centered cursorline
  use{
    'arnamak/stay-centered.nvim',
    config = require('config.ui.staycenter')
  }

  -- alpha startify-fortune
  use {
    'goolord/alpha-nvim', branch = 'feature/startify-fortune',
    'BlakeJC94/alpha-nvim-fortune',
    event = 'BufRead',
    config = require('config.ui.alpha'),
    requires = {
      'BlakeJC94/alpha-nvim-fortune'
    },
  }

  -- flash.nvim
  use{
    'folke/flash.nvim',
    config = require('config.flash')
  }

  -- leap.nvim
  use{
    'ggandor/leap.nvim',
    config = require('config.leap')
  }

end)
