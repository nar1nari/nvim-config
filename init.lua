vim.g.mapleader = ' '

-- General options
vim.o.clipboard = 'unnamedplus'
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.winborder = 'rounded'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmatch = true
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.colorcolumn = '80'
vim.o.laststatus = 3
vim.o.undofile = true

-- Completion options
vim.o.complete = '.,o'
vim.o.completeopt = 'fuzzy,menuone,noselect'
vim.o.pumheight = 7

-- Command mode mapping
vim.api.nvim_set_keymap('n', ';', ':', {})

-- File picker
vim.keymap.set('n', '<leader>f', function() vim.cmd('Pick files') end)

-- Diagnostics
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>D', vim.diagnostic.setloclist)

-- Plugin list
vim.pack.add({
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/nvim-mini/mini.base16' },
    { src = 'https://github.com/nvim-mini/mini.pairs' },
    { src = 'https://github.com/nvim-mini/mini.pick' },
    { src = 'https://github.com/nvim-mini/mini.cursorword' },
    { src = 'https://github.com/nvim-mini/mini.hipatterns' },
    { src = 'https://github.com/nvim-mini/mini.icons' },
    { src = 'https://github.com/rafamadriz/friendly-snippets' },
    { src = 'https://github.com/nvim-mini/mini.snippets' },
    { src = 'https://github.com/nvim-mini/mini.completion' },
    { src = 'https://github.com/andweeb/presence.nvim' },
    { src = 'https://github.com/nvim-mini/mini.indentscope' },
    { src = 'https://github.com/nvim-mini/mini.diff' },
    { src = 'https://github.com/mrcjkb/rustaceanvim' },
    { src = 'https://github.com/sontungexpt/witch-line' }
})

require('presence').setup({})
require('witch-line').setup()

require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()

require('mini.pairs').setup()
require('mini.pick').setup()
require('mini.cursorword').setup()
require('mini.diff').setup()

require('mini.indentscope').setup({ symbol = '╎' })

require('mini.hipatterns').setup({
    highlighters = {
        hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
    },
})

require('mini.base16').setup({
    palette = {
        base00 = '#161616', -- background
        base01 = '#262626', -- current line
        base02 = '#393939', -- selection
        base03 = '#646464', -- dimmed text
        base04 = '#ffffff', -- special
        base05 = '#ffffff', -- foreground
        base06 = '#393939',
        base07 = '#dde1e6',

        base08 = '#ee5396', -- red
        base09 = '#ffe97b', -- yellow/orange
        base0A = '#ffe97b', -- yellow
        base0B = '#42be65', -- green
        base0C = '#3ddbd9', -- cyan
        base0D = '#ff7eb6', -- magenta
        base0E = '#33b1ff', -- blue
        base0F = '#dde1e6', -- extra
    },
    use_cterm = nil,
    plugins = { default = true },
})

local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup({
    snippets = {
        gen_loader.from_file('~/.config/nvim/snippets/global.json'),

        gen_loader.from_lang(),
    },
})

require('mini.completion').setup()

-- LSP configuration
vim.lsp.enable({ 'lua_ls', 'clangd', 'ty', 'wgsl-analyzer' })

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true)
            }
        }
    }
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local set = vim.keymap.set
        local opts = { buffer = args.buf, silent = true }

        set('n', 'K', vim.lsp.buf.hover, opts)
        set('n', 'gd', vim.lsp.buf.definition, opts)
        set('n', 'gD', vim.lsp.buf.declaration, opts)
        set('n', 'gi', vim.lsp.buf.implementation, opts)
        set('n', 'gt', vim.lsp.buf.type_definition, opts)
        set('n', 'gr', vim.lsp.buf.references, opts)
        set('n', 'ff', vim.lsp.buf.format, opts)

        set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        set('n', '<leader>r', vim.lsp.buf.rename, opts)
    end,
})

local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set('n', '<leader>a', function()
    vim.cmd.RustLsp('codeAction')
end, { silent = true, buffer = bufnr })

vim.keymap.set('n', 'K', function()
    vim.cmd.RustLsp({ 'hover', 'actions' })
end, { silent = true, buffer = bufnr })
