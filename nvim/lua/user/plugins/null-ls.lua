local ok, null_ls = pcall(require, 'null-ls')
if not ok then
    vim.notify('Could not load "null-ls": ' .. vim.inspect(null_ls))
    return
end

local formatting = null_ls.builtins.formatting

null_ls.setup {
    sources = {
        formatting.stylua,
    },
}
