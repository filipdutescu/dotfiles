local lsp_ok, nvim_lsp = pcall(require, 'lspconfig')
if not lsp_ok then
    vim.notify('Could not load "lspconfig": ' .. vim.inspect(nvim_lsp))
    return
end

local cmp_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_lsp_ok then
    vim.notify('Could not load "cmp_nvim_lsp": ' .. vim.inspect(cmp_nvim_lsp))
    return
end

require'user.lsp.handlers'.setup()
