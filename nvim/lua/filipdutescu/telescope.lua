require'telescope'.load_extension'fzy_native'

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require\'telescope.builtin\'.find_files()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require\'telescope.builtin\'.live_grep()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fG', '<cmd>lua require\'telescope.builtin\'.git_files()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua require\'telescope.builtin\'.buffers()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require\'telescope.builtin\'.help_tags()<cr>', {noremap = true, silent = true})

vim.cmd 'hi default link TelescopeSelection Number'

