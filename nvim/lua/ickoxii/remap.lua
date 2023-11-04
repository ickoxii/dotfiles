-- Leader
vim.g.mapleader = " "

-- Remaps
-- Remaps use a 'leader', which as defined above, is a space
-- arg1: which mode this keymap is defined in. in this case, 'n' is normal
-- arg2: command, in this case is `<space>` + `p` + `v`, ie. ` pv`
-- arg3: vim command this keymap replaces
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
