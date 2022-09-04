vim.cmd [[colorscheme default]]

local theme = 'springan'

local ok, err = pcall(vim.cmd, 'colorscheme ' .. theme)
if not ok then
    vim.notify('Could not find "' .. theme .. '" theme: ' .. vim.inspect(err))
    return
end
