return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                diagnostics = "nvim_lsp",
                show_buffer_close_icons = true,
                show_close_icon = true,
                separator_style = "thin",
                always_show_bufferline = true,
                offsets = {
                    {
                        separator = true

                    }
                }
            },
        })
    end,
}
