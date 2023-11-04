-- Set tab width to 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Enable auto-expand tabs
vim.o.expandtab = true

-- Except for make files
vim.cmd([[
    autocmd FileType make setlocal noexpandtab
]])

-- Enable relative line numbers with current line showing
-- vim.api.nvim_command('set number relativenumber')
vim.o.number = true
vim.o.relativenumber = true

-- Enable text wrapping at 80 characters
vim.o.textwidth = 80
vim.o.wrap = true

-- Disable automatic commenting in comment blocks
vim.cmd[[au BufEnter * set fo-=cro fo-=o fo-=r]]
