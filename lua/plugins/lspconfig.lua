return {
    'neovim/nvim-lspconfig',
    config = function()
        local lspconfig = require('lspconfig')
        lspconfig.pyright.setup{
            settings = {
                python = {
                    analysis = {
                        extraPaths = {"."}
                    }
                }
            }
        }
        lspconfig.lua_ls.setup{
            settings = { Lua = {
                workspace = {
                    checkThirdParty = false,
                    library = vim.tbl_deep_extend('force', vim.api.nvim_get_runtime_file("", true), {
                        "${3rd}/luv/library",
                        "${3rd}/busted/library",
                        "/usr/share/awesome/lib",
                        "/usr/share/lua",
                    }),
                },
                diagnostics = {
                    globals = {
                        "awesome",
                        "awful",
                        "client",
                        "screen",
                        "tag",
                        "root",
                    },
                },
                runtime = { version = 'LuaJIT' },
                completion = { callSnippet = "Replace", },
                telemetry = { enable = false, },
            }}
        }

        lspconfig.clangd.setup{}
        lspconfig.phpactor.setup{}
        lspconfig.tsserver.setup{}
        lspconfig.html.setup{}
        lspconfig.cssls.setup{}
    end,
}

