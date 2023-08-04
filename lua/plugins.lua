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
  use 'navarasu/onedark.nvim'

  -- Autocomplete and Lsp
  use {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'hrsh7th/vim-vsnip-integ',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'rafamadriz/friendly-snippets',
    'onsails/lspkind.nvim',
    'kkharji/lspsaga.nvim',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'dsznajder/vscode-es7-javascript-react-snippets',
    run = 'yarn install --frozen-lockfile && yarn compile'
  }

  -- requires web-devicons
  use {
    'nvim-lualine/lualine.nvim',
    'nvim-tree/nvim-tree.lua',
    'akinsho/bufferline.nvim',
    'kyazdani42/nvim-web-devicons',
    'utilyre/barbecue.nvim',
    'SmiteshP/nvim-navic',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter',
    'windwp/nvim-ts-autotag',
    'HiPhish/nvim-ts-rainbow2',
    'windwp/nvim-autopairs',
    run = ':TSUpdate'
  }

  -- Single use
  use {
    'norcalli/nvim-colorizer.lua',
    'lewis6991/gitsigns.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'folke/which-key.nvim',
    'akinsho/toggleterm.nvim',
    'terrortylor/nvim-comment',
    'folke/zen-mode.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'folke/twilight.nvim',
    'lewis6991/impatient.nvim',
    'kylechui/nvim-surround'
  }

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  -- session manager
  use 'Shatur/neovim-session-manager'

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
    requires = {'BlakeJC94/alpha-nvim-fortune'},
  }

  -- hslsens
  use 'kevinhwang91/nvim-hlslens'

  -- flash.nvim
  use 'folke/flash.nvim'

  -- leap.nvim
  use 'ggandor/leap.nvim'

end)
