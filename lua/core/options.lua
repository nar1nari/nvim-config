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

vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

opt.colorcolumn = "80"

opt.laststatus = 3
-- opt.showmode = false

opt.undofile = true

vim.cmd [[highlight Normal guibg=none]]
vim.cmd [[highlight NormalNC guibg=none]]
