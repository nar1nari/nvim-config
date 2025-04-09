return {
    "sontungexpt/sttusline",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = { "BufEnter" },
    config = function(_, opts)
        require("sttusline").setup {
            statusline_color = "#262626",
            -- statusline_color = "StatusLine",

            -- | 1 | 2 | 3
            -- recommended: 3
            laststatus = 3,
            disabled = {
                filetypes = {
                    -- "NvimTree",
                    -- "lazy",
                },
                buftypes = {
                    -- "terminal",
                },
            },
            components = {
                "mode",
                "filename",
                "git-branch",
                "git-diff",
                "%=",
                "diagnostics",
                "lsps-formatters",
                "indent",
                "encoding",
                "pos-cursor",
            },
        }
        local mode = require("sttusline.components.mode")
        mode.set_config {
            auto_hide_on_vim_resized = false,
        }

        local encoding = require("sttusline.components.encoding")
        encoding.set_config {
            ["utf-8"] = "󰉿 UTF-8",
            ["utf-16"] = "󰉿 UTF-16",
            ["utf-32"] = "󰉿 UTF-32",
            ["utf-8mb4"] = "󰉿 utf8mb4",
            ["utf-16le"] = "󰉿 UTF-16LE",
            ["utf-16be"] = "󰉿 UTF-16BE",
        }
    end,
}

