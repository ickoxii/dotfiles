return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",

  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  config = function()
    require('telescope').setup({})

    local builtin = require('telescope.builtin')
    -- [p]roject [f]iles
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

    -- [g]it file [s]earch
    vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
    -- vim.keymap.set('n', '<C-p>', builtin.git_files, {})

    -- [p]roject [w]ith [s]tring (?)
    vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)

    -- [p]roject [W]ith [s]tring
    -- honextly i dont know the fucking difference between this and the last one
    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)

    -- [p]roject [s]tring search
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)

    -- [v]iew [h]elp
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
  end
}
