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
  -- Color Scheme
  use ({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  -- Git-Hub-Dark
  -- Color Scheme
--  use({
--	  'projekt0n/github-nvim-theme',
--	  config = function()
--		  vim.cmd('colorscheme github_dark')
--	  end
--  })

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

end)
