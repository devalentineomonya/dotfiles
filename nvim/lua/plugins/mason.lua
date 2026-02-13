return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"tsgo",
					"eslint",
					"tailwindcss",
					"emmet_ls",
					"html",
					"cssls",
					"jsonls",
					"yamlls",
					"marksman",
					"clangd",
					"gopls",
					"pyright",
					"jdtls",
					"intelephense",
					"rust_analyzer",
				},
				automatic_installation = true,
			})
		end,
	},

	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"stylua",
					"prettier",
					"black",
					-- add formatters/linters
				},
				automatic_installation = true,
			})
		end,
	},
}
