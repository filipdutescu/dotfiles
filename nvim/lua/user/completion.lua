local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
    vim.notify('Could not load "nvim-cmp": ' .. vim.inspect(cmp))
    return
end

local luasnip_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_ok then
    vim.notify('Could not load "luasnip": ' .. vim.inspect(luasnip))
    return
end

local lspkind_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_ok then
    vim.notify('Could not load "lspkind": ' .. vim.inspect(lspkind))
    return
end

require'luasnip/loaders/from_vscode'.lazy_load()

local is_whitespace = function()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
end

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert {
        ['<c-d>'] = cmp.mapping.scroll_docs(-4),
        ['<c-f>'] = cmp.mapping.scroll_docs(4),
        ['<c-e>'] = cmp.mapping.close(),
        ['<cr>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<c-space>'] = cmp.mapping.complete(),
        ['<tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif is_whitespace() then
                fallback()
            else
                fallback()
            end 
        end, {
            'i',
            's',
        }),
        ['<s-tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end 
        end, {
            'i',
            's',
        }),
    },

    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 5 },
        { name = 'path' },
        { name = 'nvim_lua' },
    },

    -- sorting = {
    --     comparators = {
    --         cmp.config.compare.offset,
    --         cmp.config.compare.exact,
    --         cmp.config.compare.score,
    --
    --         function(entry1, entry2)
    --             local _, entry1_under = entry1.completion_item.label:find '^_+'
    --             local _, entry2_under = entry2.completion_item.label:find '^_+'
    --             entry1_under = entry1_under or 0
    --             entry2_under = entry2_under or 0
    --             if entry1_under > entry2_under then
    --                 return false
    --             elseif entry1_under < entry2_under then
    --                 return true
    --             end
    --         end,
    --
    --         cmp.config.compare.kind,
    --         cmp.config.compare.sort_text,
    --         cmp.config.compare.length,
    --         cmp.config.compare.order,
    --     },
    -- },

    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = '[buf]',
                nvim_lsp = '[lsp]',
                nvim_lua = '[api]',
                path = '[path]',
                luasnip = '[snip]',
            },
        },
    },

    experimental = {
        native_menu = false,
        ghost_text = true,
    },
}

local autopairs_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not autopairs_ok then
    vim.notify('Could not load "autopairs" "nvim-cmp" extension; ' .. vim.inspect(cmp_autopairs))
    return
end

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done {
        map_char = {
            tex = '',
        },
    }
)
