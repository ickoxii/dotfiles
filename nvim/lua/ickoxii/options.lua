-- thicc vim cursor (in insert mode)
vim.opt.guicursor = ""

-- Enable relative line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Set tabs to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Keep tabs for Makefiles and Dockerfiles
vim.cmd([[
    autocmd FileType make       setlocal noexpandtab
    autocmd FileType dockerfile setlocal noexpandtab
]])

-- Set tabs to 2 spaces for html, json, xml
vim.cmd([[
    autocmd FileType html   setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType javascript     setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType javascriptreact     setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType xml    setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType json   setlocal shiftwidth=2 softtabstop=2 expandtab
]])

-- Only multi-line comments will continue comment on new line
vim.opt.formatoptions = "c"

-- Enable auto indenting and set to spaces
-- vim.opt.smartindent = false
-- vim.opt.shiftwidth = 4

-- Enable start indent on new-line
vim.opt.smartindent = true

-- Enable incremental searching
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Disable text wrap
vim.opt.wrap = false

-- Vertical bar at 80 chars
vim.opt.colorcolumn = "80"

-- Enable text wrapping at 80 characters
-- vim.opt.textwidth = 80
-- vim.opt.wrap = true

-- Set leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better nvim pane splitting (default is up and left respectively)
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Enable ignorecase + smartcase for searching

-- Persisting undos
-- vim.opt.swapfile = false
-- vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Better fps bc we're gamers
-- Increase frequency we write to swap file
vim.opt.updatetime = 50

-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 8

-- Good colors (24-bit)
vim.opt.termguicolors = true

---------------------
-- NEW CUSTOMIZATIONS
---------------------
-- Play around with these and see what we like/don't like

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- Enable cursor line highlight
vim.opt.cursorline = true

-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
-- vim.opt.foldcolumn = "0"
-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 99
-- vim.opt.foldenable = true

-- Customized cursor
-- vim.opt.guicursor = {
-- 	"n-v-c:block", -- Normal, visual, command-line: block cursor
-- 	"i-ci-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
-- 	"r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
-- 	"o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
-- 	"a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
-- 	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
-- }
