local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local handlers = require("lsp.handlers")
local servers = require("lsp.servers")

mason.setup()
mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = true,
})

for server_name, opts in pairs(servers) do
    vim.lsp.config(server_name, vim.tbl_deep_extend("force", {
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities,
    }, opts))
end

for server_name, _ in pairs(servers) do
    vim.lsp.enable(server_name)
end
