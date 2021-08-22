require'dap.ext.vscode'.load_launchjs()

local dap = require'dap'
dap.adapters.rust = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb'
}

dap.adapters.cpp = dap.adapters.rust
dap.adapters.c = dap.adapters.rust

vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua require\'dap\'.continue()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><F5>', '<cmd>lua require\'dap\'.disconnect { restart = true }<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F9>', '<cmd>lua require\'dap\'.toggle_breakpoint()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><F9>', '<cmd>lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua require\'dap\'.step_over()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F11>', '<cmd>lua require\'dap\'.step_into()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F12>', '<cmd>lua require\'dap\'.step_out()<cr>', {noremap = true, silent = true})

require'dapui'.setup {}

vim.api.nvim_set_keymap('n', '<F3>', '<cmd>lua require\'dap\'.disconnect() require\'dap\'.close() require\'dapui\'.close()<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>de', '<cmd>lua require\'dapui\'.eval()<cr>', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>de', '<cmd>lua require\'dapui\'.eval()<cr>', {noremap = true})

