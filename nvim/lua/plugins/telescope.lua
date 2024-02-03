-- The Primagen
return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local actions = require("telescope.actions")
        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        -- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        -- ["<C-x>"] = actions.delete_buffer,
                    },
                },
                hidden = true;
            }
        })

        local builtin = require('telescope.builtin')

        -- Search for file (respecting .gitignore)
        -- Matches filenames rather than text within files
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

        -- Search for git files
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})

        -- Search for word under the cursor in local file
        -- word - only alphanumeric and underscores
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)

        -- Search for WORD under cursor in local directory
        -- WORD - alphanumeric, underscores, AND whitespace
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)

        -- [P]roject [S]earch
        -- Search for any text within the project
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

        -- Search help tags
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}
-- From the other dude
--[[
return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
                cond = vim.fn.executable("cmake") == 1,
            },
        },
        config = function()
            local actions = require("telescope.actions")

            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                            ["<C-x>"] = actions.delete_buffer,
                        },
                    },
                    file_ignore_patterns = {
                        "node_modules",
                        "yarn.lock",
                        ".git",
                        ".sl",
                        "_build",
                        ".next",
                    },
                    hidden = true,
                },
            })

            -- Enable telescope fzf native, if installed
            pcall(require("telescope").load_extension, "fzf")
        end,
    },
}
]]--
