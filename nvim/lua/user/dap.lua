require'dap.ext.vscode'.load_launchjs()

local ok, dap = pcall(require, 'dap')
if not ok then
    vim.notify('Could not load "dap": ' .. vim.inspect(dap))
    return
end

dap.adapters.rust = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb'
}

dap.adapters.cpp = dap.adapters.rust
dap.adapters.c = dap.adapters.rust

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<f5>', '<cmd>lua require\'dap\'.continue()<cr>', opts)
keymap('n', '<leader><f5>', '<cmd>lua require\'dap\'.disconnect { restart = true }<cr>', opts)
keymap('n', '<f9>', '<cmd>lua require\'dap\'.toggle_breakpoint()<cr>', opts)
keymap('n', '<leader><f9>', '<cmd>lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<cr>', opts)
keymap('n', '<f10>', '<cmd>lua require\'dap\'.step_over()<cr>', opts)
keymap('n', '<f11>', '<cmd>lua require\'dap\'.step_into()<cr>', opts)
keymap('n', '<f12>', '<cmd>lua require\'dap\'.step_out()<cr>', opts)

-- setup UI and mappings specific to UI
local ui_ok, dap_ui = pcall(require, 'dapui')
if not ui_ok then
    vim.notify('Could not load "dapui": ' .. vim.inspect(dap_ui))
else
    dap_ui.setup {}

    keymap('n', '<f3>', '<cmd>lua require\'dap\'.disconnect() require\'dap\'.close() require\'dapui\'.close()<cr>', opts)
    keymap('n', '<leader>de', '<cmd>lua require\'dapui\'.eval()<cr>', { noremap = true })
    keymap('v', '<leader>de', '<cmd>lua require\'dapui\'.eval()<cr>', { noremap = true })
end

local vtxt_ok, dap_vtxt = pcall(require, 'nvim-dap-virtual-text')
if not vtxt_ok then
    vim.notify('Could not load "nvim-dap-virtual-text": ' .. vim.inspect(dap_vtxt))
else
    dap_vtxt.setup {}
end
