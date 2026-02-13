-- Space as leader key
vim.g.mapleader = " "

-- Insert mode: exit with 'jk'
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Move line down/up
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")

vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Quick save & quit
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })

-- Better navigation in wrapped lines
vim.keymap.set('n', 'j', 'v:count == 0 ? "gj" : "j"', { noremap = true, expr = true, silent = true })
vim.keymap.set('n', 'k', 'v:count == 0 ? "gk" : "k"', { noremap = true, expr = true, silent = true })

-- Jump to deginition and references
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)

-- Telescope versions
vim.keymap.set("n", "<leader>gd", ":Telescope lsp_definitions<CR>")
vim.keymap.set("n", "<leader>gr", ":Telescope lsp_references<CR>")

-- Fuzzy find with telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help tags" })

-- Find and replace with spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})


-- Open files switching
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { silent = true })

-- Nvim-tree
vim.keymap.set('n', '<leader>o', ':NvimTreeFocus<CR>', { desc = "Focus file explorer" })
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = "Toggle file explorer" })

-- Built-in LSP diagnostics
vim.keymap.set("n", "<leader>t", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>f", vim.diagnostic.setqflist, { desc = "Diagnostics to quickfix" })

-- Trouble.nvim integration (if installed)
local ok, _ = pcall(require, "trouble")
if ok then
    vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",
        { desc = "Document diagnostics (Trouble)" })
    vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
        { desc = "Workspace diagnostics (Trouble)" })
end
