-- File: colors.lua
-- Author: Icko Iben
-- Date Created: 3 November 2023
-- Date Last Modified: 3 November 2023
-- Version: 1.0
-- TODO: this shit broke lmao

-- Set a default color scheme
vim.cmd('colorscheme rose-pine')

-- Global Function
function ColorMyPencils(color)
	-- We either use default color or rose-pine-moon
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	-- Set transparent background
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
