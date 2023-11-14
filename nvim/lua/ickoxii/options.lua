-- Get a thick cursor like in vim
vim.opt.guicursor = ""

-- Set tab width to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Enable auto-expand tabs
vim.opt.expandtab = true
-- Except for make files
vim.cmd([[
    autocmd FileType make setlocal noexpandtab
]])

-- Enable relative line numbers with current line showing
-- vim.api.nvim_command('set number relativenumber')
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable text wrapping at 80 characters
-- vim.opt.textwidth = 80
-- vim.opt.wrap = true

-- Disable automatic commenting in comment blocks
vim.cmd[[au BufEnter * set fo-=cro fo-=o fo-=r]]

-- Search options
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- We want good colors
vim.opt.termguicolors = true

-- Minimum of 8 lines showing at top
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Persisting undos
-- vim.opt.swapfile = false
-- vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Fast update
vim.opt.updatetime = 50

-- Vertical bar at 80 chars
vim.opt.colorcolumn = "80"

-- If we want to make our leader consistent with other utils
-- vim.g.mapleader = " "
