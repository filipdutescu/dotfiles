local ok, telescope = pcall(require, 'telescope')
if not ok then
    vim.notify('Could not load "telescope": ' .. vim.inspect(telescope))
    return
end
telescope.load_extension 'fzy_native'
telescope.load_extension 'notify'

local keymap = vim.keymap.set
local opts = {
    noremap = true,
    silent = true,
}
local telescope_cmd = function(name)
    return '<cmd>lua require\'telescope.builtin\'.' .. name .. '()<cr>'
end

keymap('n', '<leader>ff', telescope_cmd('find_files'), opts)
keymap('n', '<leader>fg', telescope_cmd('git_files'), opts)
keymap('n', '<leader>fG', telescope_cmd('live_grep'), opts)
keymap('n', '<leader>fb', telescope_cmd('buffers'), opts)
keymap('n', '<leader>fh', telescope_cmd('help_tags'), opts)
keymap('n', '<leader>fn', '<cmd>lua require\'telescope\'.extensions.notify.notify()<cr>', opts)

vim.cmd [[hi default link TelescopeSelection Number]]
