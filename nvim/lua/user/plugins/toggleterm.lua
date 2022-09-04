local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then
    vim.notify('Could not load "toggleterm": ' .. vim.inspect(toggleterm))
    return
end

toggleterm.setup {
    open_mapping = [[<c-\>]],
    size = 20,
}

function _G.set_toggleterm_keymaps()
    local keymap = vim.keymap.set
    local opts = { noremap = true, buffer = 0 }

    keymap('t', '<c-z>', [[<c-\><c-n>]], opts)
    keymap('t', '<c-h>', [[<c-\><c-n><c-w>h]], opts)
    keymap('t', '<c-j>', [[<c-\><c-n><c-w>j]], opts)
    keymap('t', '<c-k>', [[<c-\><c-n><c-w>k]], opts)
    keymap('t', '<c-l>', [[<c-\><c-n><c-w>l]], opts)
end

vim.cmd [[autocmd! TermOpen term://*toggleterm#* lua set_toggleterm_keymaps()]]
