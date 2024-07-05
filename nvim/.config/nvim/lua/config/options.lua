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
    autocmd FileType html               setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType javascript         setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType javascriptreact    setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType typescript         setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType typescriptreact    setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType xml                setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType json               setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType yaml               setlocal shiftwidth=2 softtabstop=2 expandtab
]])

-- Continue comment blocks on new lines
vim.opt.formatoptions = "cro"

-- Enable start indent on new-line
vim.opt.smartindent = true

-- Enable incremental searching
-- vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Disable text wrap
vim.opt.wrap = false

-- Vertical bar at 80 chars
vim.opt.colorcolumn = "80"

-- Enable text wrapping at 80 characters
-- vim.opt.textwidth = 80
-- vim.opt.wrap = true

-- Better nvim pane splitting (default is up and left respectively)
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Enable mouse mode
vim.opt.mouse = "a"

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

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- Enable cursor line highlight
vim.opt.cursorline = true

---------------------
-- NEW CUSTOMIZATIONS
---------------------
-- Play around with these and see what we like/don't like

-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
-- vim.opt.foldcolumn = "0"
-- vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 99
-- vim.opt.foldenable = true
