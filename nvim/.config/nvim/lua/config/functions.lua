-- File: functions.lua
-- Author: Icko Iben
-- Date Created: 5 July 2024
-- Date Last Modified: 5 July 2024

-- >>>> Pandoc Markdown >>>>
-- This autocommand pandocs a markdown file into a pdf file whenever it is
-- written. If you have a pdf previewer that auto-refreshes whenever a pdf is
-- updated, this allows you to take notes in your vim terminal and watch the
-- updates live on your pdf.
--
-- Since this pandoc function is slow, this feature starts toggled off. It
-- can be invoked by using the command :TP

_G.pandoc_enabled = false

-- Function to toggle Pandoc on/off
function TogglePandoc()
	_G.pandoc_enabled = not _G.pandoc_enabled
	if _G.pandoc_enabled then
		vim.cmd('autocmd BufWritePost *.md !pandoc % --pdf-engine=xelatex -H ~/.config/latex/preambles/math.tex --highlight-style=breezedark -o %:r.pdf')
		vim.api.nvim_out_write('Pandoc enabled: PDF will be generated on save.\n')
	else
		vim.cmd('autocmd! BufWritePost *.md')
		vim.api.nvim_out_write('Pandoc disabled.\n')
	end
end

-- Command to toggle Pandoc
vim.cmd("command! TP lua TogglePandoc()")
-- <<<< Pandoc Markdown <<<<
