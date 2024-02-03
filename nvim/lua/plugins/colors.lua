---@diagnostic disable: missing-fields

function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {
    {
        "rose-pine/nvim",
        lazy = false; -- Disable lazy loading for main color theme
        priority = 1000; -- Load before everything else
        config = function()
            require("rose-pine").setup({
                integrations = {
                    cmp = true,
                    -- gitsigns = true,
                    harpoon = true,
                    -- illuminate = true,
                    -- indent_blankline = {
                    -- 	enabled = false,
                    -- 	scope_color = "sapphire",
                    -- 	colored_indent_levels = false,
                    -- },
                    mason = true,
                    native_lsp = { enabled = true },
                    -- notify = true,
                    -- nvimtree = true,
                    -- neotree = true,
                    -- symbols_outline = true,
                    telescope = true,
                    treesitter = true,
                    treesitter_context = true,
                },
            })

            vim.cmd.colorscheme("rose-pine-moon")

            ColorMyPencils()
        end,
    },

    {
        "folke/tokyonight.nvim",
        lazy = true; -- Lazy load backup color schemes
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
            })
        end
    },

    {
        "catppuccin/catppuccin",
        lazy = true;
        config = function()
            -- require("catppuccin").setup({})
            vim.cmd.colorscheme("catppuccin-machiatto")
        end
    },
}
