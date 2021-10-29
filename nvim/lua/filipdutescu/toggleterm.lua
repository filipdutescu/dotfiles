local toggleterm = require 'toggleterm'

toggleterm.setup {
    open_mapping = [[<C-\>]],
}

function _G.set_toggleterm_keymaps()
    vim.api.nvim_buf_set_keymap(0, 't', '<C-z>', [[<C-\><C-n>]], { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], { noremap = true })
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], { noremap = true })
end

vim.cmd [[autocmd! TermOpen term://*toggleterm#* lua set_toggleterm_keymaps()]]

