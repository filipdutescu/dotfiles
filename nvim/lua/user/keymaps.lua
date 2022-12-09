local keymap = vim.keymap.set
local modes = {
    all = '',
    normal = 'n',
    insert = 'i',
    visual = 'v',
    visual_block = 'x',
}
local opts = {
    noremap = true,
    silent = true,
}

-- set leader
keymap(modes.all, '<space>', '<nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--keymap(modes.normal, '<leader>ch', '<cmd>lua require"renamer".rename()<cr>', opts)

-- clear highlights
keymap(modes.normal, '<leader>r', '<cmd>noh<cr>', opts)

-- better window navigation
keymap(modes.normal, '<c-q>', '<c-w>q', opts)
keymap(modes.normal, '<c-h>', '<c-w>h', opts)
keymap(modes.normal, '<c-j>', '<c-w>j', opts)
keymap(modes.normal, '<c-k>', '<c-w>k', opts)
keymap(modes.normal, '<c-l>', '<c-w>l', opts)
keymap(modes.normal, '<a-->', '<c-w>-', opts)
keymap(modes.normal, '<a-+>', '<c-w>+', opts)

-- tab navigation
keymap(modes.normal, '<a-q>', ':tabclose<cr>', opts)
keymap(modes.normal, '<a-Q>', ':tabonly<cr>', opts)
keymap(modes.normal, '<a-h>', ':tabprevious<cr>', opts)
keymap(modes.normal, '<a-l>', ':tabnext<cr>', opts)

-- indent selected blocks
keymap(modes.visual, '<', '<gv', opts)
keymap(modes.visual, '>', '>gv', opts)

-- move blocks
--keymap(modes.visual, '<a-j>', ':move .+1<cr>==', opts)
--keymap(modes.visual, '<a-k>', ':move .-2<cr>==', opts)
keymap(modes.visual_block, '<a-j>', ':move \'>+1<cr>gv-gv', opts)
keymap(modes.visual_block, '<a-k>', ':move \'<-2<cr>gv-gv', opts)
