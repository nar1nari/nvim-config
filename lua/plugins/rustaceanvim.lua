return {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function ()
        vim.g.rustaceanvim = {
            server = {
                default_settings = {
                    ['rust-analyzer'] = {
                        diagnostics = {
                            disabled = {"unlinked-file"}
                        }
                    }
                }
            }
        }
    end
}

