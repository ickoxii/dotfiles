# Neovim Config

Author: Icko Iben  

References:  
1. [ThePrimeagen's Config](https://github.com/ThePrimeagen/neovimrc)
2. [DmMulroy's Kickstart Config](https://github.com/dmmulroy/kickstart.nix/tree/main/config/nvim)

## Table of Contents

1. [Basic Organization](#basic-organization)
    * [./init.lua](#initlua)
    * [lua](#lua)
    * [lua/ickoxii](#lua/ickoxii)
    * [lua/plugins](#lua/plugins)
2. [Basic Information](#basic-information)
    * [ThePrimeagen](#theprimeagen)
    * [Dillon Mulroy](#dillon-mulroy)
3. [`clangd` QuickFix](#clangd-quickfix)

## Basic Organization

The directory is organized as follows:  

```
.
|_after/
|   |_plugins/
|       |_.
|_init.lua
|_lua/
   |_ickoxii/
   |    |_init.lua
   |    |_lazy.lua
   |    |_other-nvim-configurations.lua
   |_plugins/
        |_init.lua
        |_lsp.lua
        |_colors.lua
        |_other-plugins-and-their-keybinds.lua
```

I have an `after` directory. I don't know whats its used for or why its there, 
but it is there (its actually for additional plugin configurations. This is 
where I changed my keybinds for each plugins in my previous nvim config, but 
using `lazy.nvim` as a plugin manager makes it easy to put keybinds in the 
same place as where the plugins are being invoked).  

### ./init.lua

The `init.lua` in the base directory serves no other purpose than to define a 
target where the rest of my configuration is stored. It is literally: 

```lua
require("ickoxii")
```

### lua

`lua/` is where my configurations are stored. It is separated into `ickoxii/` 
and `plugins/`.

### lua/ickoxii

`ickoxii` is where all of my nvim configurations are stored. The `init.lua` file 
in this directory specifies the rest of my configuration files. It also 
sources my autocommand file for generating a template from a skeleton file, 
which I had issues converting into lua. See below:

```lua
-- lua/ickoxii/init.lua

vim.cmd('source ' .. '~/.config/nvim/lua/ickoxii/templates.vim')
require("ickoxii.options")
require("ickoxii.lazy")
require("ickoxii.remaps")
require("ickoxii.pandoc")
```

`lazy.lua` is where the lazy package manager is invoked. It is just a copy+paste 
of a bootstrap setup taken from the lazy.nvim github page. I added extra lines 
that specify the directory where all of my plugins are. 

### lua/plugins

Where the plugins are stored. lmao  

The `init.lua` file in the plugins directory has no other purpose than to 
call the `plenary.nvim` dependency for `telescope.nvim`.  

Of course, colorschemes are loaded in the `colors.lua` file.  

Everything else should be pretty self-explanatory, with filenames closely 
resembling, if not matching, the name of the plugin it is used for.

## Basic Information

This neovim configuration uses `folke/lazy.nvim` as a plugin manager. There is 
heavy inspiration from both ThePrimeagen's and Dillon Mulroy's neovim configurations. 
I appreciate the very lightweight implementation of ThePrimeagen, and love his 
minimalist setup and keybinds. I found some useful organization and interesting 
plugins through Mulroy's configurations.  

### ThePrimeagen

The first Prime configuration I followed had the 'holy five' plugins:

1. Telescope
    * Dependency: plenary.nvim
2. Harpoon
3. LSP
    * treesitter - syntax highlighting
    * Mason - LSP package manager
    * nvim-cmp - autocomplete or smth
4. Undo tree
5. Fugitive  

Telescope is a fuzzy finder that can search across multiple directories. Harpoon 
allows the user to 'harpoon' up to 4 (maybe 5 idk) files and provides hot-keys to 
quickly swap between the harpooned files. LSP (language server protocol) is a 
pretty standard IDE-like feature that provides language features like 
auto-suggestions. Undo-tree I do not have much experience with, but it is 
bound to `<leader>u` for me. Fugitive provides git integration which I still 
don't fully understand nor have much experience with.  

Nowadays he has a few more plugins, see his [GitHub repository](https://github.com/ThePrimeagen/neovimrc/) 
for updated configurations.  

Some of the new interesting ones he uses are:  

1. Cloak - censor sensitive information
2. Trouble - LSP error navigation or something like that

### Dillon Mulroy

Dillon Mulroy has a fantastic video going through his configuration (see 
[here](https://www.youtube.com/watch?v=oo_I5lAmdi0&t=2293s)). He has a lot of 
interesting plugins, some of the more notable ones I have implemented are listed below:  

1. MarkdownPreviewer - have a live updated preview the .md file you are editing
2. fidgit - spinny dots when things are loading
3. indent-blankline - show vertical bars at each indentation level
4. cmp - i guess auto-completion
5. dressing - nice borders around mini-windows (i.e. auto-suggestions)

There are also some other plugins that I may find interesting:  

1. lualine - customized bottom bar
2. symbols-outline - idk?
3. ufo - better folding
4. dap - debugger
5. wilder - better ui for command mode (auto-suggestions n shi)

## `clangd` QuickFix

<https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md>  

1. Have `clangd` installed (installed by default on macOS)
2. Add `require'lspconfig'.clangd.setup{}` to your `init.lua`
    * For me, I added it to [lsp.lua](./lua/plugins/lsp.lua)
3. Pray
