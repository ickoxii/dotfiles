-- ~/.config/nvim/ftplugin/vdocx.lua
print("vdocx attached")

-- Enable spell checking
vim.opt_local.spell = true
vim.opt_local.spelllang = { "en_us" }

-- Set wrap and linebreak for better essay writing
vim.opt_local.textwidth = 80
vim.opt_local.linebreak = true
vim.opt_local.wrap = true
vim.opt_local.formatoptions:append("t")

-- Use 4 spaces for indentation
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4

-- Custom keybindings for .vdocx files
vim.keymap.set('n', 'j', 'gj', { buffer = true }) -- Move down visually
vim.keymap.set('n', 'k', 'gk', { buffer = true }) -- Move up visually
vim.keymap.set('v', 'j', 'gj', { buffer = true }) -- Move down visually
vim.keymap.set('v', 'k', 'gk', { buffer = true }) -- Move up visually

-- Correct word in insert mode
vim.keymap.set('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u', { buffer = true })
