-- This file can be loaded by calling `lua require('plugins')` from your init.vim


-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope.nvim
  -- Fuzzy Finder
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Rose-pine
  -- Light: rose-pine-dawn
  -- Dark:  rose-pine rose-pine-moon
  use ({
	  'rose-pine/neovim',
	  as = 'rose-pine',     -- `as` sets an alias to use above
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  -- Git-Hub-Dark
  -- Color Scheme
  use({
	  'projekt0n/github-nvim-theme',
      as = 'gh-dark',
	  config = function()
          vim.cmd('colorscheme github_dark')
	  end
  })

  -- Catppuccin
  -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catpuccin-mocha
  -- Favorite: catppuccin-macchiato
  use({
      'catppuccin/nvim',
      config = function()
          vim.cmd('colorscheme catppuccin')
      end
  })

  -- Tokyo Night
  -- Light: tokyonight-day
  -- Dark:  tokyonight-storm tokyonight tokyonight-night tokyonight-moon
  -- Favorite: tokyonight-moon
  use({
      'folke/tokyonight.nvim',
      config = function()
          vim.cmd('colorscheme tokyonight')
      end
  })

  -- Treesitter
  -- Code Parser and syntax highlighter
  -- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('nvim-treesitter/playground')

  -- Harpoon
  use ('theprimeagen/harpoon')

  -- Undo tree
  use ('mbbill/undotree')

  -- Vim Fugitive
  use ('tpope/vim-fugitive')

  -------------
  -- LSP Config
  -------------

  use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          --Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
      }
  }

end)
