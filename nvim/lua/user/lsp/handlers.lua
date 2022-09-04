local M = {}

local nvim_lsp = require 'lspconfig'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'
local capabilities = vim.lsp.protocol.make_client_capabilities()

local set_symbol_under_cursor_highlighting = function(client, buf_nr)
    if not client.resolved_capabilities.document_highlight then
        return
    end

    local lspHighlightAugroup = vim.api.nvim_create_augroup('LspHighlightSymbol', { clear = true })
    vim.api.nvim_create_autocmd('CursorHold', {
        group = lspHighlightAugroup,
        buffer = buf_nr,
        callback = function() vim.lsp.buf.document_highlight() end
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
        group = lspHighlightAugroup,
        buffer = buf_nr,
        callback = function() vim.lsp.buf.clear_references() end
    })
end

local setup_diagnostic_signs = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "ﯦ" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
    end

    vim.diagnostic.config {
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        float = {
            border = 'rounded'
        }
    }
end

local customize_lsp_handlers = function()
    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true,
            signs = true,
            update_in_insert = true,
        }
    )

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = 'rounded',
    })
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = 'rounded',
    })
end

-- M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

local on_attach = function(client, buf_nr)
    if client.name == 'sumneko_lua' then
        client.resolved_capabilities.document_formatting = false
    end

    require'user.lsp.keymaps'.setup(buf_nr)
    set_symbol_under_cursor_highlighting(client, buf_nr)
end
-- M.on_attach = on_attach

local enable_lsp_for_languages = function()
    local languages = {
        'angularls',
        'clangd',
        'cmake',
        'rust_analyzer',
        'sumneko_lua',
        'yamlls',
    }

    for _, lang in ipairs(languages) do
        local settings = {}
        local config_ok, custom_config = pcall(require, 'user.lsp.settings.' .. lang)
        if config_ok == true then
            settings = custom_config
        end

        settings.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
        settings.on_attach = on_attach
        nvim_lsp[lang].setup(settings)
    end
end

M.setup = function()
    setup_diagnostic_signs()

    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    customize_lsp_handlers()

    enable_lsp_for_languages()
end

return M
