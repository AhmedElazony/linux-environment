local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'lunarvim/darkplus.nvim'
  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'navarasu/onedark.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
       'nvim-telescope/telescope.nvim',
       tag = '0.1.8',
       requires = {
		{'nvim-lua/plenary.nvim'},
	},
  }
  use {'nvim-telescope/telescope-ui-select.nvim' }
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
  }
  use {
     "adalessa/laravel.nvim",
     "tpope/vim-dotenv",
     "MunifTanjim/nui.nvim",
     "nvimtools/none-ls.nvim"
  }
  use 'phpactor/phpactor'
  use "stevearc/conform.nvim"
  use 'mfussenegger/nvim-lint'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use "craftzdog/solarized-osaka.nvim"
  use "numToStr/Comment.nvim"
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
