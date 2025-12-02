return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "nightfly",
                component_separators = { left = '|', right = '|' },
                section_separators = { left = '', right = '' },
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { 'close' }
                }

            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        })
    end,
}
