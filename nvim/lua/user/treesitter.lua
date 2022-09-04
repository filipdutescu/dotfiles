local ok, ts_configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
    vim.notify('Could not load "treesitter": ' .. vim.inspect(ts_configs))
    return
end

ts_configs.setup {
    ensure_installed = {
        'bash',
        'c',
        'c_sharp',
        'cmake',
        'comment',
        'cpp',
        'css',
        'dockerfile',
        'gitignore',
        'help',
        'html',
        'http',
        'javascript',
        'jsdoc',
        'json',
        'json5',
        'jsonc',
        'lua',
        'make',
        'markdown',
        'rasi',
        'regex',
        'rust',
        'scss',
        'sql',
        'toml',
        'typescript',
        'vim',
        'yaml',
    },
    sync_install = false,
    auto_install = true,
    ignore_install = { '' },
    highlight = {
        enable = true,
        disable = { '' },
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
    context_commentstring = {
        enable = true,
    },
}
