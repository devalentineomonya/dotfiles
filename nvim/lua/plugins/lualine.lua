return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/trouble.nvim" },

    opts = function()
        -- BASE OPTIONS
        local opts = {
            options = {
                theme = "nightfly",
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { "close" },
                },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        }

        -- TROUBLE SYMBOLS
        local trouble = require("trouble")
        local symbols = trouble.statusline({
            mode = "lsp_document_symbols",
            groups = {},
            title = false,
            filter = { range = true },
            format = "{kind_icon}{symbol.name:Normal}",
            hl_group = "lualine_c_normal",
        })

        table.insert(opts.sections.lualine_c, {
            symbols.get,
            cond = symbols.has,
        })

        return opts
    end,

    config = function(_, opts)
        require("lualine").setup(opts)
    end,
}
