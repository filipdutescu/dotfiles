local fn = vim.fn
local a = vim.api

-- automagically install packer.nvim if not present
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }

    vim.notify 'Installing packer.nvim'
    vim.cmd [[packadd packer.nvim]]
end

a.nvim_create_autocmd('BufWritePost', {
    group = a.nvim_create_augroup('PackerCustomCommands', { clear = true }),
    pattern = '*/lua/user/plugins/init.lua',
    command = [[source <afile> | PackerSync]],
})

local ok, packer = pcall(require, 'packer')
if not ok then
    vim.notify('Could not find packer.nvim: ' .. vim.inspect(packer))
    return
end

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    },
}

return packer.startup(function(use)
    -- manage self
    use 'wbthomason/packer.nvim'

    -- common
    use 'nvim-lua/plenary.nvim'

    -- eye candy
    use 'kyazdani42/nvim-web-devicons'
    use {
        'brenoprata10/nvim-highlight-colors',
        config = function() require'nvim-highlight-colors'.setup { render = 'background' } end,
    }
    use {
        'rcarriga/nvim-notify',
        config = function() vim.notify = require'notify' end,
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require'indent_blankline'.setup {
                show_end_of_line = true,
            }
        end
    }

    -- telescope.nvim
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' }, { 'rcarriga/nvim-notify' } },
    }
    use {
        'nvim-telescope/telescope-fzy-native.nvim',
        run = 'make',
        requires = { { 'nvim-telescope/telescope.nvim' } },
        config = function() require'user.plugins.telescope' end,
    }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'             -- add VSCode-like pictograms to LSP menu

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require'nvim-treesitter.install'.update { with_sync = true } end,
    }
    use {
        'p00f/nvim-ts-rainbow',
        requires = { { 'nvim-treesitter/nvim-treesitter' } }
    }
    use {
        'JoosepAlviste/nvim-ts-context-commentstring',
        requires = { { 'nvim-treesitter/nvim-treesitter' } },
    }

    -- autocompletion framework for built-in LSP
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    -- snippets plugins
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    -- debugging
    use 'mfussenegger/nvim-dap'
    use {
        'rcarriga/nvim-dap-ui',
        requires = { { 'mfussenegger/nvim-dap' } }
    }
    use {
        'theHamsta/nvim-dap-virtual-text',
        requires = { { 'mfussenegger/nvim-dap' }, { 'nvim-treesitter/nvim-treesitter' } },
    }

    -- terminal
    use {
        'akinsho/toggleterm.nvim',
        config = function() require'user.plugins.toggleterm' end,
    }

    -- editing
    use {
        'numToStr/Comment.nvim',
        requires = { { 'JoosepAlviste/nvim-ts-context-commentstring' } },
    }
    use {
        'windwp/nvim-autopairs',
        config = function() require'nvim-autopairs'.setup {} end,
    }
    use {
        'filipdutescu/renamer.nvim',
        branch = 'master',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function() require'renamer'.setup() end,
    }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function() require'user.plugins.null-ls' end,
    }

    -- git
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release',
        config = function() require'user.plugins.gitsigns' end,
    }
    use {
        'sindrets/diffview.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { { 'kyazdani42/nvim-web-devicons' } },
        config = function() require'user.plugins.nvim-tree' end,
    }

    -- colorscheme
    use 'filipdutescu/springan.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        packer.sync()
    end
end)
