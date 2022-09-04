local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
    vim.notify('Could not load "nvim-tree": ' .. vim.inspect(nvim_tree))
    return
end

local keymap = vim.keymap.set

keymap('n', '<c-b>', '<cmd>lua require\'nvim-tree\'.toggle()<cr>', { noremap = true, silent = true })

nvim_tree.setup {
    open_on_tab = true,
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    diagnostics = {
        enable = true,
    },
}
