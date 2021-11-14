-- nvim_lsp object
local nvim_lsp = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup {
    capabilities = capabilities,
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
local lua_runtime_root = '/usr/share/lua'
local lua_runtime = lua_runtime_root .. '/' .. lua_version
local luajit_version = '2.0.5'
local luajit_runtime = '/usr/share/luajit-' .. luajit_version
local luarocks_libs = '/usr/lib/luarocks/rocks-' .. lua_version
local lua_awesome_libs = '/usr/share/awesome/lib'

nvim_lsp.sumneko_lua.setup {
    cmd = { 'lua-language-server' },
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = lua_version,
                path = {
                    '?.lua',
                    '?/init.lua',
                    luajit_runtime .. '/?.lua',
                    lua_runtime .. '/?.lua',
                    lua_runtime .. '/?/init.lua',
                    luarocks_libs .. '/?.lua',
                    luarocks_libs .. '/?/init.lua',
                    lua_awesome_libs .. '/?.lua',
                    lua_awesome_libs .. '/?/init.lua',
                },
            },
            diagnostics = { globals = { 'vim' }, },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [lua_runtime] = true,
                    [luarocks_libs] = true,
                    [lua_awesome_libs] = true,
                },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false, },
        },
    },
}

-- Enable Clangd
nvim_lsp.clangd.setup {
    capabilities = capabilities,
    root_dir = function() return vim.loop.cwd() end
}

-- Enable CMake
nvim_lsp.cmake.setup {}

-- Enable Yaml
nvim_lsp.yamlls.setup {}

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)

-- Inline hints
vim.cmd [[
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }
]]

-- Highlight current word occurences
-- vim.api.nvim_command [[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
-- vim.api.nvim_command [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
-- vim.api.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]

