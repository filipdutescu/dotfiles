local o = vim.opt

-- sign and number columns
o.relativenumber = true
o.scrolloff = 8
o.signcolumn = 'yes'

-- eye candy
o.termguicolors = true
o.list = true
o.listchars:append 'eol:'

-- searching opts
o.incsearch = true
o.hlsearch = true
o.ignorecase = true             -- ignore case when searching
o.smartcase = true              -- search with case if specified to do so

-- completion opts
o.wildmenu = true
o.completeopt = { 'menuone', 'noinsert', 'noselect' }

o.clipboard = 'unnamedplus'

-- backup current file and delete backup after
o.backup = false
o.writebackup = true
o.updatetime = 300

-- set tab space of 4
local tab_width = 4
o.smarttab = true
o.tabstop = tab_width
o.softtabstop = tab_width
o.shiftwidth = tab_width
o.autoindent = true             -- keep indent on new line
o.expandtab = true              -- expand tab to spaces

-- buffers, splits, windows
o.hidden = true
o.splitbelow = true
o.splitright = true
o.fileencoding = 'utf-8'
o.wrap = false
o.cursorline = true

-- status line
o.showmode = false
o.laststatus = 3                -- global statusline
o.cmdheight = 2                -- more message space

-- tab line
o.showtabline = 2               -- always show tabline
