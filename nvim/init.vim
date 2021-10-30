"    $$$\ $$\   $$\ $$$\   $$\    $$\ $$\                      $$$$$$\                       $$$$$$\  $$\
"   $$  _|$$$\  $$ | \$$\  $$ |   $$ |\__|                    $$  __$$\                     $$  __$$\ \__|
"  $$  /  $$$$\ $$ |  \$$\ $$ |   $$ |$$\ $$$$$$\$$$$\        $$ /  \__| $$$$$$\  $$$$$$$\  $$ /  \__|$$\  $$$$$$\
"  $$ |   $$ $$\$$ |   $$ |\$$\  $$  |$$ |$$  _$$  _$$\       $$ |      $$  __$$\ $$  __$$\ $$$$\     $$ |$$  __$$\
"  $$ |   $$ \$$$$ |   $$ | \$$\$$  / $$ |$$ / $$ / $$ |      $$ |      $$ /  $$ |$$ |  $$ |$$  _|    $$ |$$ /  $$ |
"  \$$\   $$ |\$$$ |  $$  |  \$$$  /  $$ |$$ | $$ | $$ |      $$ |  $$\ $$ |  $$ |$$ |  $$ |$$ |      $$ |$$ |  $$ |
"   \$$$\ $$ | \$$ |$$$  /    \$  /   $$ |$$ | $$ | $$ |      \$$$$$$  |\$$$$$$  |$$ |  $$ |$$ |      $$ |\$$$$$$$ |
"    \___|\__|  \__|\___/      \_/    \__|\__| \__| \__|       \______/  \______/ \__|  \__|\__|      \__| \____$$ |
"                                                                                                         $$\   $$ |
"                                                                                                         \$$$$$$  |
"                                                                                                          \______/



" Vim-Plug setup

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source "~/.config/nvim/init.vim"
endif

"  $$$$$$$\  $$\                     $$\                           $$\ $$\                          $$\
"  $$  __$$\ \__|                    $$ |                         $$  |$$ |                         $$ |
"  $$ |  $$ |$$\  $$$$$$$\  $$$$$$\  $$ | $$$$$$\  $$\   $$\     $$  / $$ |      $$$$$$\   $$$$$$\  $$ |  $$\
"  $$ |  $$ |$$ |$$  _____|$$  __$$\ $$ | \____$$\ $$ |  $$ |   $$  /  $$ |     $$  __$$\ $$  __$$\ $$ | $$  |
"  $$ |  $$ |$$ |\$$$$$$\  $$ /  $$ |$$ | $$$$$$$ |$$ |  $$ |  $$  /   $$ |     $$ /  $$ |$$ /  $$ |$$$$$$  /
"  $$ |  $$ |$$ | \____$$\ $$ |  $$ |$$ |$$  __$$ |$$ |  $$ | $$  /    $$ |     $$ |  $$ |$$ |  $$ |$$  _$$<
"  $$$$$$$  |$$ |$$$$$$$  |$$$$$$$  |$$ |\$$$$$$$ |\$$$$$$$ |$$  /     $$$$$$$$\\$$$$$$  |\$$$$$$  |$$ | \$$\
"  \_______/ \__|\_______/ $$  ____/ \__| \_______| \____$$ |\__/      \________|\______/  \______/ \__|  \__|
"                          $$ |                    $$\   $$ |
"                          $$ |                    \$$$$$$  |
"                          \__|                     \______/

set number
set relativenumber
set termguicolors
set maxmempattern=20000
set guicursor=
set scrolloff=8

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

"  $$$$$$$$\                              $$\     $$\                               $$\ $$\   $$\
"  $$  _____|                             $$ |    \__|                              $$ |\__|  $$ |
"  $$ |   $$\   $$\ $$$$$$$\   $$$$$$$\ $$$$$$\   $$\  $$$$$$\  $$$$$$$\   $$$$$$\  $$ |$$\ $$$$$$\   $$\   $$\
"  $$$$$\ $$ |  $$ |$$  __$$\ $$  _____|\_$$  _|  $$ |$$  __$$\ $$  __$$\  \____$$\ $$ |$$ |\_$$  _|  $$ |  $$ |
"  $$  __|$$ |  $$ |$$ |  $$ |$$ /        $$ |    $$ |$$ /  $$ |$$ |  $$ | $$$$$$$ |$$ |$$ |  $$ |    $$ |  $$ |
"  $$ |   $$ |  $$ |$$ |  $$ |$$ |        $$ |$$\ $$ |$$ |  $$ |$$ |  $$ |$$  __$$ |$$ |$$ |  $$ |$$\ $$ |  $$ |
"  $$ |   \$$$$$$  |$$ |  $$ |\$$$$$$$\   \$$$$  |$$ |\$$$$$$  |$$ |  $$ |\$$$$$$$ |$$ |$$ |  \$$$$  |\$$$$$$$ |
"  \__|    \______/ \__|  \__| \_______|   \____/ \__| \______/ \__|  \__| \_______|\__|\__|   \____/  \____$$ |
"                                                                                                     $$\   $$ |
"                                                                                                     \$$$$$$  |
"                                                                                                      \______/

let mapleader = "\<Space>"
set incsearch                     " Search as soon as typing
set nohlsearch                  " Don't highlight all results
set ignorecase                  " Ignore case when searching
set smartcase                     " Use case only if it exists in search
set wildmenu                      " Expand commands
set hidden                  " Keep buffers in background
filetype plugin indent on   " Turn on file type detection and indent
syntax on                         " Turn on syntax highlighting

" Visual block keep selection after indenting
vmap < <gv
vmap > >gv


"  $$$$$$\                       $$\               $$\ $$\       $$$$$$$\  $$\                     $$\
"  \_$$  _|                      $$ |              $$ |$$ |      $$  __$$\ $$ |                    \__|
"    $$ |  $$$$$$$\   $$$$$$$\ $$$$$$\    $$$$$$\  $$ |$$ |      $$ |  $$ |$$ |$$\   $$\  $$$$$$\  $$\ $$$$$$$\   $$$$$$$\
"    $$ |  $$  __$$\ $$  _____|\_$$  _|   \____$$\ $$ |$$ |      $$$$$$$  |$$ |$$ |  $$ |$$  __$$\ $$ |$$  __$$\ $$  _____|
"    $$ |  $$ |  $$ |\$$$$$$\    $$ |     $$$$$$$ |$$ |$$ |      $$  ____/ $$ |$$ |  $$ |$$ /  $$ |$$ |$$ |  $$ |\$$$$$$\
"    $$ |  $$ |  $$ | \____$$\   $$ |$$\ $$  __$$ |$$ |$$ |      $$ |      $$ |$$ |  $$ |$$ |  $$ |$$ |$$ |  $$ | \____$$\
"  $$$$$$\ $$ |  $$ |$$$$$$$  |  \$$$$  |\$$$$$$$ |$$ |$$ |      $$ |      $$ |\$$$$$$  |\$$$$$$$ |$$ |$$ |  $$ |$$$$$$$  |
"  \______|\__|  \__|\_______/    \____/  \_______|\__|\__|      \__|      \__| \______/  \____$$ |\__|\__|  \__|\_______/
"                                                                                        $$\   $$ |
"                                                                                        \$$$$$$  |
"                                                                                         \______/

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-fugitive'

Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'filipdutescu/springan.vim'

" need nvim nightly or 0.5+
Plug 'norcalli/nvim-colorizer.lua'

Plug 'nvim-lua/plenary.nvim'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
"
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
" Extensions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/lsp_extensions.nvim'

Plug 'onsails/lspkind-nvim'

" Autocompletion framework for built-in LSP
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" Snippets plugin
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'windwp/nvim-autopairs'

Plug 'akinsho/toggleterm.nvim'

Plug 'numToStr/Comment.nvim'

Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

Plug 'filipdutescu/renamer.nvim', { 'branch': 'master' }

call plug#end()


"  $$$$$$$\  $$\                     $$\                  $$$$$$\                       $$$$$$\  $$\
"  $$  __$$\ $$ |                    \__|                $$  __$$\                     $$  __$$\ \__|
"  $$ |  $$ |$$ |$$\   $$\  $$$$$$\  $$\ $$$$$$$\        $$ /  \__| $$$$$$\  $$$$$$$\  $$ /  \__|$$\  $$$$$$\   $$$$$$$\
"  $$$$$$$  |$$ |$$ |  $$ |$$  __$$\ $$ |$$  __$$\       $$ |      $$  __$$\ $$  __$$\ $$$$\     $$ |$$  __$$\ $$  _____|
"  $$  ____/ $$ |$$ |  $$ |$$ /  $$ |$$ |$$ |  $$ |      $$ |      $$ /  $$ |$$ |  $$ |$$  _|    $$ |$$ /  $$ |\$$$$$$\
"  $$ |      $$ |$$ |  $$ |$$ |  $$ |$$ |$$ |  $$ |      $$ |  $$\ $$ |  $$ |$$ |  $$ |$$ |      $$ |$$ |  $$ | \____$$\
"  $$ |      $$ |\$$$$$$  |\$$$$$$$ |$$ |$$ |  $$ |      \$$$$$$  |\$$$$$$  |$$ |  $$ |$$ |      $$ |\$$$$$$$ |$$$$$$$  |
"  \__|      \__| \______/  \____$$ |\__|\__|  \__|       \______/  \______/ \__|  \__|\__|      \__| \____$$ |\_______/
"                          $$\   $$ |                                                                $$\   $$ |
"                          \$$$$$$  |                                                                \$$$$$$  |
"                           \______/                                                                  \______/


" For specific servers
set nobackup
set nowritebackup
set updatetime=300  " better time than the default of 4000

" vim-closetag

" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.js,*.tsx'
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xml,*.xhtml,*.jsx,*.js,*.tsx'
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,jsx,js,tsx'
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xml,xhtml,jsx,js,tsx'
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
            \   'typescript.tsx': 'jsxRegion,tsxRegion',
            \   'javascript.jsx': 'jsxRegion',
            \ }
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

" Hexokinase config

if &termguicolors
    let g:Hexokinase_refreshEvents = ['InsertLeave', 'TextChanged', 'BufWrite', 'BufRead']
    let g:Hexokinase_optInPatterns = [
                \     'full_hex',
                \     'triple_hex',
                \     'rgb',
                \     'rgba',
                \     'hsl',
                \     'hsla',
                \     'colour_names'
                \ ]

    let g:Hexokinase_highlighters = ['backgroundfull']
endif

" springan.vim

colorscheme springan
" The cursor line needs to be set after the theme to work properly
"set cursorline
"set cursorcolumn
"highlight CursorLine ctermbg=Black cterm=bold guibg=#2c2c2c
"highlight CursorColumn ctermbg=Black cterm=bold guibg=#2c2c2c

"   $$$$$$\                                $$\             $$\
"  $$  __$$\                               \__|            $$ |
"  $$ /  \__| $$$$$$\  $$$$$$$\   $$$$$$$\ $$\  $$$$$$$\ $$$$$$\    $$$$$$\  $$$$$$$\   $$$$$$$\ $$\   $$\
"  $$ |      $$  __$$\ $$  __$$\ $$  _____|$$ |$$  _____|\_$$  _|  $$  __$$\ $$  __$$\ $$  _____|$$ |  $$ |
"  $$ |      $$ /  $$ |$$ |  $$ |\$$$$$$\  $$ |\$$$$$$\    $$ |    $$$$$$$$ |$$ |  $$ |$$ /      $$ |  $$ |
"  $$ |  $$\ $$ |  $$ |$$ |  $$ | \____$$\ $$ | \____$$\   $$ |$$\ $$   ____|$$ |  $$ |$$ |      $$ |  $$ |
"  \$$$$$$  |\$$$$$$  |$$ |  $$ |$$$$$$$  |$$ |$$$$$$$  |  \$$$$  |\$$$$$$$\ $$ |  $$ |\$$$$$$$\ \$$$$$$$ |
"   \______/  \______/ \__|  \__|\_______/ \__|\_______/    \____/  \_______|\__|  \__| \_______| \____$$ |
"                                                                                                $$\   $$ |
"                                                                                                \$$$$$$  |
"                                                                                                 \______/

set nocompatible
set encoding=UTF-8
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab
set splitbelow splitright
set completeopt=menuone,noinsert,noselect


"   $$$$$$\    $$\                $$\                         $$\ $$\
"  $$  __$$\   $$ |               $$ |                        $$ |\__|
"  $$ /  \__|$$$$$$\    $$$$$$\ $$$$$$\   $$\   $$\  $$$$$$$\ $$ |$$\ $$$$$$$\   $$$$$$\
"  \$$$$$$\  \_$$  _|   \____$$\\_$$  _|  $$ |  $$ |$$  _____|$$ |$$ |$$  __$$\ $$  __$$\
"   \____$$\   $$ |     $$$$$$$ | $$ |    $$ |  $$ |\$$$$$$\  $$ |$$ |$$ |  $$ |$$$$$$$$ |
"  $$\   $$ |  $$ |$$\ $$  __$$ | $$ |$$\ $$ |  $$ | \____$$\ $$ |$$ |$$ |  $$ |$$   ____|
"  \$$$$$$  |  \$$$$  |\$$$$$$$ | \$$$$  |\$$$$$$  |$$$$$$$  |$$ |$$ |$$ |  $$ |\$$$$$$$\
"   \______/    \____/  \_______|  \____/  \______/ \_______/ \__|\__|\__|  \__| \_______|
"
"
"

let g:current_mode={
            \   'n': 'Normal',
            \   'no': 'N-Operator Pending',
            \   'v': 'Visual',
            \   'V': 'V-Line',
            \   "\<C-V>": 'V-Block',
            \   's': 'Select',
            \   'S': 'S-Block',
            \   'i': 'Insert',
            \   'R': 'Replace',
            \   'Rv': 'V-Replace',
            \   'c': 'Command',
            \   'cv': 'Vim Ex',
            \   'ce': 'Ex',
            \   'r': 'Prompt',
            \   'rm': 'More',
            \   'r?': 'Confirm',
            \   '!': 'Shell',
            \   't': 'Terminal'
            \ }

function! GetGitBranchName()
    let branch = FugitiveStatusline()
    let result = ''

    if len(branch)
        let result .= ' '
        let result .= branch[5:-3]
    endif

    return result
endfunction

set noshowmode
set laststatus=2
set statusline=
set statusline=%#StatusLineNC#
set statusline+=▶\ %{tolower(g:current_mode[mode()])}\ ◀%#Normal#
set statusline+=\ %#Constant#%{&modified?'✘':'✔'}\ %f%#Normal#
set statusline+=\ %#LineNr#%{GetGitBranchName()}
set statusline+=%=
set statusline+=\ %#Type#\ %{&filetype==''?'-':tolower(&filetype)}%#Normal#
set statusline+=\ %#Function#\ %#Visual#%{&fenc==''?'-':tolower(&fenc)}%{&fileformat==''?'-':'['.tolower(&fileformat).']'}%#Normal#
set statusline+=\ %#CursorLineNr#⎋\ %p%%\ %#SignColumn#\ %l/%L\ \ %c\


"  $$\   $$\
"  $$ | $$  |
"  $$ |$$  / $$$$$$\  $$\   $$\ $$$$$$\$$$$\   $$$$$$\   $$$$$$\   $$$$$$$\
"  $$$$$  / $$  __$$\ $$ |  $$ |$$  _$$  _$$\  \____$$\ $$  __$$\ $$  _____|
"  $$  $$<  $$$$$$$$ |$$ |  $$ |$$ / $$ / $$ | $$$$$$$ |$$ /  $$ |\$$$$$$\
"  $$ |\$$\ $$   ____|$$ |  $$ |$$ | $$ | $$ |$$  __$$ |$$ |  $$ | \____$$\
"  $$ | \$$\\$$$$$$$\ \$$$$$$$ |$$ | $$ | $$ |\$$$$$$$ |$$$$$$$  |$$$$$$$  |
"  \__|  \__|\_______| \____$$ |\__| \__| \__| \_______|$$  ____/ \_______/
"                     $$\   $$ |                        $$ |
"                     \$$$$$$  |                        $$ |
"                      \______/                         \__|

" Map Ctrl+b as the command to open Netrw
map <silent> <C-b> <cmd>call ToggleExplorer()<CR>
inoremap <silent> <C-b> <ESC><cmd>call ToggleExplorer()<CR>

" terminal
nnoremap <leader>ot <cmd>terminal<cr>i

" vim-fugitive

nnoremap <leader>gs <cmd>G<cr>
nnoremap <leader>gf <cmd>diffget //2<cr>
nnoremap <leader>gh <cmd>diffget //3<cr>

" LSP

" Code navigation shortcuts
imap     <c-space>              <cmd>lua vim.lsp.buf.completion()<cr>
inoremap <silent> <F2>          <cmd>lua require'renamer'.rename()<cr>
nnoremap <silent> gd            <cmd>lua require'telescope.builtin'.lsp_definitions()<cr>
nnoremap <silent> K             <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent> gi            <cmd>lua require'telescope.builtin'.lsp_implementations()<cr>
nnoremap <silent> <c-k>         <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <silent> 1gD           <cmd>lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent> gr            <cmd>lua require'telescope.builtin'.lsp_references()<cr>
nnoremap <silent> g0            <cmd>lua vim.lsp.buf.document_symbol()<cr>
nnoremap <silent> gW            <cmd>lua vim.lsp.buf.workspace_symbol()<cr>
nnoremap <silent> gD            <cmd>lua vim.lsp.buf.declaration()<cr>
nnoremap <silent> ga            <cmd>lua require'telescope.builtin'.lsp_code_actions()<cr>
nnoremap <silent> <leader>rn    <cmd>lua require'renamer'.rename()<cr>

" Diagnostics

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<cr>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<cr>

lua require'filipdutescu'

augroup formatting
    " Remove old au commands
    au!
    autocmd InsertLeave,BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
augroup END
