return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("nvim-treesitter.configs").setup({

            ensure_installed = {
                "lua",
                "javascript",
                "typescript",
                "tsx",
                "html",
                "css",
                "python",
                "bash",
                "json",
                "go",
                "markdown",
                "c",
                "java"
            },

            highlight = { enable = true },
            indent = { enable = true },

            -------------------------------------------------------------------------
            -- Incremental Selection
            -------------------------------------------------------------------------
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",    -- Start selection
                    node_incremental = "grn",  -- Grow selection
                    scope_incremental = "grc", -- Jump to parent scope
                    node_decremental = "grm",  -- Shrink selection
                },
            },

            -------------------------------------------------------------------------
            -- TEXTOBJECTS (copy, delete, select structures)
            -------------------------------------------------------------------------
            textobjects = {

                -----------------------------------------------------------------------
                -- 1. Select textobjects (yaf, vaf, etc.)
                -----------------------------------------------------------------------
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        -- Functions
                        ["af"] = "@function.outer", -- Entire function
                        ["if"] = "@function.inner", -- Inside function

                        -- Classes (JS/TS/React)
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",

                        -- Blocks / scopes
                        ["ab"] = "@block.outer",
                        ["ib"] = "@block.inner",

                        -- Loops
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",

                        -- Conditionals (if/else)
                        ["ai"] = "@conditional.outer",
                        ["ii"] = "@conditional.inner",

                        -------------------------------------------------------------------
                        -- Custom Textobjects
                        -------------------------------------------------------------------

                        -- React JSX Component <Component>...</Component>
                        ["ar"] = "@react_component.outer",
                        ["ir"] = "@react_component.inner",

                        -- Go struct { ... }
                        ["as"] = "@struct.outer",
                        ["is"] = "@struct.inner",
                    },
                },

                -----------------------------------------------------------------------
                -- 2. Movement (]f, [f)
                -----------------------------------------------------------------------
                move = {
                    enable = true,
                    set_jumps = true, -- Add to jumplist

                    goto_next_start = {
                        ["]f"] = "@function.outer", -- Next function
                        ["]c"] = "@class.outer",    -- Next class
                        ["]s"] = "@struct.outer",   -- Next Go struct
                    },

                    goto_previous_start = {
                        ["[f"] = "@function.outer", -- Previous function
                        ["[c"] = "@class.outer",    -- Previous class
                        ["[s"] = "@struct.outer",   -- Previous Go struct
                    },
                },
            },
        })

        ---------------------------------------------------------------------------
        -- CUSTOM QUERY DEFINITIONS
        -- These are needed for React components & Go structs
        ---------------------------------------------------------------------------

        -- React: <Component>...</Component>
        vim.treesitter.query.set("tsx", "react_component", [[
      (jsx_element) @react_component.outer
      (jsx_element
        (jsx_element > (jsx_children) @react_component.inner))
    ]])

        -- Go: struct {...}
        vim.treesitter.query.set("go", "struct", [[
      (type_declaration
        (type_spec
          (struct_type) @struct.outer))
      (struct_type
        (field_declaration_list) @struct.inner)
    ]])
    end,
}
