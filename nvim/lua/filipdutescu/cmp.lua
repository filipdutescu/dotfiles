local cmp = require 'cmp'
local lspkind = require 'lspkind'

cmp.setup {
    mapping = {
        ['<c-d>'] = cmp.mapping.scroll_docs(-4),
        ['<c-f>'] = cmp.mapping.scroll_docs(4),
        ['<c-e>'] = cmp.mapping.close(),
        ['<cr>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<c-space>'] = cmp.mapping.complete(),
    },

    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 5 },
        { name = 'path' },
        { name = 'nvim_lua' },
    },

    sorting = {
        -- TODO: Would be cool to add stuff like 'See variable names before method names' in rust, or something like that.
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,

            function(entry1, entry2)
                local _, entry1_under = entry1.completion_item.label:find '^_+'
                local _, entry2_under = entry2.completion_item.label:find '^_+'
                entry1_under = entry1_under or 0
                entry2_under = entry2_under or 0
                if entry1_under > entry2_under then
                return false
                elseif entry1_under < entry2_under then
                return true
                end
            end,

            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = '[buf]',
        nvim_lsp = '[LSP]',
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

