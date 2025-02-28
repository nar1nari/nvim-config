local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "

map("n", "<leader>c", "<CMD>make<CR>", {})
-- map("n", "<leader>r", "<CMD>make run<CR>", {})
map("n", ";", ":", {})

vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)

vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
