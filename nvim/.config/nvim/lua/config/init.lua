require("config.remaps")
require("config.set")
require("config.lazy")
require("config.functions")

vim.filetype.add({
  extension = {
    vdocx = "vdocx",
  },
})

-- Create an autocommand group for vdocx settings
-- [V]im docx
vim.api.nvim_create_augroup("VDocxSettings", { clear = true })

-- Define an autocommand within this group
vim.api.nvim_create_autocmd("FileType", {
  pattern = "vdocx",
  callback = function()
    -- Load specific settings for vdocx files
    require("config.vdocx")
  end,
  group = "VDocxSettings",
})
