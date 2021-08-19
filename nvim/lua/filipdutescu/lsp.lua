-- nvim_lsp object
local nvim_lsp = require'lspconfig'

-- function to attach completion when setting up lsp
local on_attach = function(client)
    require'completion'.on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            rustfmt = {
                extraArgs = { "+nightly", },
            },
        },
    },
}

-- Enable Sumneko Lua
local lua_version = '5.4'
local lua_runtime = '/usr/share/lua'
local lua_awesome_libs = '/usr/share/awesome/lib'
nvim_lsp.sumneko_lua.setup {
    cmd = { 'lua-language-server' },
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = lua_version,
                path = {
                    '?.lua',
                    '?/init.lua',
                    lua_runtime .. '/' .. lua_version .. '/?/init.lua',
                    vim.fn.expand'$VIMRUNTIME' .. 'lua/?.lua',
                    vim.fn.expand'$VIMRUNTIME' .. 'lua/?/init.lua',
                    lua_awesome_libs .. '/?.lua',
                    lua_awesome_libs .. '/?/init.lua',
                },
            },
            diagnostics = { globals = { 'vim' }, },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [lua_runtime .. '/' .. lua_version ] = true,
                    [vim.fn.expand'$VIMRUNTIME/lua'] = true,
                    [vim.fn.expand'$VIMRUNTIME/lua/vim/lsp'] = true,
                    [lua_awesome_libs] = true,
                },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false, },
        },
    },
}

-- Enable Clangd
require'lspconfig'.clangd.setup {
    on_attach = on_attach,
    root_dir = function() return vim.loop.cwd() end
}

-- Enable CMake
require'lspconfig'.cmake.setup{}

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)

-- Inline hints
vim.cmd [[autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} } ]]

