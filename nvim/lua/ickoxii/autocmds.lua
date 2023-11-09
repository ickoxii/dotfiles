-- File name: autocmds.lua
-- Author: Icko Iben
-- Date Created: 5 November 2023
-- Date Last Modified: 5 November 2023
--
-- Autocommands for my nvim experience.

-- Define 
local templates = {
    newgitignore = "~/skeleton-files/gitignore.template",
    newtodo = "~/skeleton-files/TODO.template",
    newbaylorcsi = "~/skeleton-files/baylorcsi.template",
    newcppmake = "~/skeleton-files/Makefile.cpp.template",
    newpandocmake = "~/skeleton-files/Makefile.pandoc.template",
}

-- Create an augroup named "MyTemplates" with the clear option
local augroup = vim.api.nvim_create_augroup('MyTemplates', {clear = true})

-- Define autocmd for newgitignore
vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = 'newgitignore',
  group = augroup,
  desc = 'Create .gitignore from template',
  callback = function()
    vim.fn.system('0r ~/skeleton-files/gitignore.template')
  end
})

-- Define autocmd for newtodo
vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = 'newtodo',
  group = augroup,
  desc = 'Create TODO.md from template',
  callback = function()
    vim.fn.system('0r ~/skeleton-files/TODO.template')
  end
})

-- Define autocmd for newbaylorcsi
vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = 'newbaylorcsi',
  group = augroup,
  desc = 'Create template for baylor csi projects',
  callback = function()
    vim.fn.system('0r ~/skeleton-files/baylorcsi.template')
  end
})

-- Define autocmd for newcppmake
vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = 'newcppmake',
  group = augroup,
  desc = 'Create cpp Makefile',
  callback = function()
    vim.fn.system('0r ~/skeleton-files/Makefile.cpp.template')
  end
})

-- Define autocmd for newpandocmake
vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = 'newpandocmake',
  group = augroup,
  desc = 'Create pandoc Makefile',
  callback = function()
    vim.fn.system('0r ~/skeleton-files/Makefile.pandoc.template')
  end
})
