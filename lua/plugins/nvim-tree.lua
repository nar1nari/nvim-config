return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        local nvimtree = require('nvim-tree')

        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
        })
        local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        local map = vim.api.nvim_set_keymap 
        local keymap = vim.keymap
        local tree = require('nvim-tree.api')
        -- Nvim-Tree --
        map("n", "<leader>t", "<CMD>NvimTreeToggle<CR>", {})
        map("n", "<leader>f", "<CMD>NvimTreeFocus<CR>", {})
        keymap.set('n', '+',     tree.fs.create,                         opts('Create'))
        keymap.set('n', '<A-Down>', tree.tree.change_root_to_node, opts('CD'))
        keymap.set('n', '<A-Up>',     tree.node.navigate.parent,              opts('Parent Directory'))
    end,
}

