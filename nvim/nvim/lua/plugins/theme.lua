return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,   
    config = function()
    require("catppuccin").setup({
      flavour = "mocha", 
        integrations = {
        telescope = true,
        treesitter = true,
        gitsigns = true,
        nvimtree = true,
        cmp = true,
        lsp_trouble = true,
        which_key = true,
        indent_blankline = { enabled = true },
      },
        background = { 
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    float = {
        transparent = false, 
                solid = false, 
            },
            lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
        virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
        },
        underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
        },
        inlay_hints = {
            background = true,
        },
    },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}

