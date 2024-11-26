-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Easy netrw opening
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Easy clear hls
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Easier yanking to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- I mean I guess
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Easy chmoding
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Fun functions - '[m]ake [i]t [r]ain' and '[g]ame [o]f [l]ife;
vim.keymap.set("n", "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>")

-- Shoutout
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Better navigation for long lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("v", "j", "gj")
vim.keymap.set("v", "k", "gk")

-- Copilot completions
--[[
vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
--]]
