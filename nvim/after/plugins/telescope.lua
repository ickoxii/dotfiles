-- File: telescope.lua
-- Author: Icko Iben
-- Date Created: 3 November 2023
-- Date Last Modified: 3 November 2023
-- Version: 1.0


local builtin = require('telescope.builtin')

-- All file search 'pf' for [P]roject [F]iles
-- Searches for files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- Git file search `Ctrl+p`
vim.keymap.set('n', '<C-p', builtin.git_files, {})

-- [P]roject [S]earch
-- Searches for String inside files
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
