return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'auto',
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                globalstatus = true, -- single statusline across splits
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {
                    { 'branch', icon = '🌿' },
                    { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } },
                    { 'diagnostics' },
                },
                lualine_c = { { 'filename', path = 1 } }, -- show relative path
                lualine_x = {
                    {
                        function()
                            local venv = os.getenv("VIRTUAL_ENV")
                            if venv then
                                return "🐍 " .. vim.fn.fnamemodify(venv, ":t")
                            end
                            return ""
                        end,
                        color = { fg = "#98c379" },
                    },
                    { 'encoding' },
                    { 'fileformat' },
                    { 'filetype' },
                },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
        })
    end,
}
