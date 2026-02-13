local M = {}

M.on_attach = function(_, bufnr)
    local keymap = vim.keymap.set
    local opts = { buffer = bufnr, silent = true, noremap = true }

    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

return M
