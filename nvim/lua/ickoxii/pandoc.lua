-- Define a global variable to track the Pandoc state
_G.pandoc_enabled = false

-- Function to toggle Pandoc on/off
function TogglePandoc()
	_G.pandoc_enabled = not _G.pandoc_enabled
	if _G.pandoc_enabled then
		vim.cmd('autocmd BufWritePost *.md !pandoc % --pdf-engine=xelatex -o %:r.pdf')
		vim.api.nvim_out_write('Pandoc enabled: PDF will be generated on save.\n')
	else
		vim.cmd('autocmd! BufWritePost *.md')
		vim.api.nvim_out_write('Pandoc disabled.\n')
	end
end

-- Command to toggle Pandoc
vim.cmd("command! TP lua TogglePandoc()")

-- To enable Pandoc initially, you can use the :TP command

