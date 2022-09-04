local M = {}

M.setup = function(buf_nr)
    local opts = { noremap = true, silent = true, buffer = buf_nr }
    local keymap = vim.keymap.set

    -- code navigation shortcuts
    keymap('i', '<c-space>', '<cmd>lua vim.lsp.buf.completion()<cr>', { buffer = buf_nr })
    keymap('i', '<f2>', '<cmd>lua require\'renamer\'.rename()<cr>', opts)

    keymap('n', 'gd', '<cmd>lua require\'telescope.builtin\'.lsp_definitions()<cr>', opts)
    keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    keymap('n', 'gi', '<cmd>lua require\'telescope.builtin\'.lsp_implementations()<cr>', opts)
    keymap('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    keymap('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    keymap('n', 'gr', '<cmd>lua require\'telescope.builtin\'.lsp_references()<cr>', opts)
    keymap('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<cr>', opts)
    keymap('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>', opts)
    keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    keymap('n', 'ga', '<cmd>lua require\'telescope.builtin\'.lsp_code_actions()<cr>', opts)
    keymap('n', '<leader>rn', '<cmd>lua require\'renamer\'.rename()<cr>', opts)
    keymap('n', '<leader>kf', '<cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<cr>', opts)

    -- diagnostics
    keymap('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
    keymap('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', opts)
end

return M
