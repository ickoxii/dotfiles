-- File name: autocmds.lua
-- Author: Icko Iben
-- Date Created: 5 November 2023
-- Date Last Modified: 5 November 2023
--
-- Autocommands for my nvim experience.

local function createTemplateAutocmd(templateKey, templatePath)
    local augroup = vim.api.nvim_create_augroup('MyTemplates', { clear = true })

    vim.api.nvim_create_autocmd('BufNewFile', {
        pattern = templateKey,
        group = augroup,
        desc = 'Create template: ' .. templateKey,
        callback = function()
            vim.fn.system('0r ' .. templatePath)
        end
    })
end

-- createTemplateAutocmd('newgitignore', '~/skeleton-files/gitignore.template')
-- createTemplateAutocmd('newtodo', '~/skeleton-files/TODO.template')
createTemplateAutocmd('baylorcsitemplate', '~/skeleton-files/baylorcsi.template')
-- createTemplateAutocmd('newcppmake', '~/skeleton-files/Makefile.cpp.template')
createTemplateAutocmd('genpandoctemplate', '~/skeleton-files/Makefile.pandoc.template')
