local opt = vim.opt

opt.clipboard = 'unnamedplus'

opt.number = true
opt.relativenumber = true

opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.expandtab = true

opt.ignorecase = true
opt.smartcase = true
opt.showmatch = true

-- opt.fillchars = { eob = " " }

opt.termguicolors = true

-- vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

opt.colorcolumn = "80"

opt.laststatus = 3
-- opt.showmode = false

opt.undofile = true

-- vim.cmd [[highlight Normal guibg=none]]
-- vim.cmd [[highlight NormalNC guibg=none]]
opt.background = "dark"

vim.diagnostic.config({
    virtual_text = {
        prefix = '',
        spacing = 4,
    },
})

local signs = { Error = "", Warn = "", Hint = ""}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end;

vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function()
        local highlights = {
            'Normal',
            'LineNr',
            'Folded',
            'NonText',
            'SpecialKey',
            'VertSplit',
            'SignColumn',
            'EndOfBuffer',
            'TablineFill',
        }
        for _, name in pairs(highlights) do vim.cmd.highlight(name .. ' guibg=none ctermbg=none') end
    end,
})
