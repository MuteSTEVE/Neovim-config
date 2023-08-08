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
    vim.cmd('colorscheme onedark')
	}

  use {
    'kkharji/lspsaga.nvim',
    config = require('config.lsp.lspsaga')
  }

  use{
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    config = require('config.lsp.mason')
  }

  use {
    'hrsh7th/nvim-cmp',
    config = require('config.lsp.cmp')
  }

  -- Autocomplete and Lsp
  use {
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
    run = 'yarn install --frozen-lockfile && yarn compile'
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

  -- requires web-devicons
  use {
    'kyazdani42/nvim-web-devicons',
    'utilyre/barbecue.nvim',
    'SmiteshP/nvim-navic',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = "BufWinEnter"
  }

  use {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",
    after = "nvim-treesitter",
  }

  use {
    'HiPhish/nvim-ts-rainbow2',
    after = "nvim-treesitter",
  }

  -- treesitter
  use {
    'windwp/nvim-autopairs',
    config = require('config.lsp.autopairs')
  }
  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = require('config.ui.telescope'),
  }

  use {
    'neovim/nvim-lspconfig',
    config = require('config.lsp.lspconfig')
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = require('config.colorizer'),
    event = "BufRead",
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup{
        current_line_blame = true
      }
    end
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
    'folke/zen-mode.nvim',
    'folke/twilight.nvim',
    'lewis6991/impatient.nvim',
    'kylechui/nvim-surround'
  }

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  -- noice nvim
  use {
    'folke/noice.nvim',
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
    require = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify'
    }
  }

  -- nvim illuminate
  use 'RRethy/vim-illuminate'

  -- harpoon
  use 'theprimeagen/harpoon'

  -- centered cursorline
  use "arnamak/stay-centered.nvim"

  -- cinnaom-roll
  use 'declancm/cinnamon.nvim'

  -- alpha startify-fortune
  use {
    'goolord/alpha-nvim', branch = 'feature/startify-fortune',
    'BlakeJC94/alpha-nvim-fortune',
    event = "BufRead",
    config = require('config.ui.alpha'),
    requires = {
      'BlakeJC94/alpha-nvim-fortune'
    },
  }

  -- flash.nvim
  use 'folke/flash.nvim'

  -- leap.nvim
  use 'ggandor/leap.nvim'

end)
