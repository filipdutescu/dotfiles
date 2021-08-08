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

Plug 'alvan/vim-closetag'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'filipdutescu/springan.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" need nvim nightly or 0.5+
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
" Extensions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/lsp_extensions.nvim'
" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'

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

" fzf.vim

let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.7 } }
let g:fzf_preview_window = []

" springan.vim

colorscheme springan
" The cursor line needs to be set after the theme to work properly
set cursorline
set cursorcolumn
highlight CursorLine ctermbg=Black cterm=bold guibg=#2c2c2c
highlight CursorColumn ctermbg=Black cterm=bold guibg=#2c2c2c

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


"  $$\   $$\            $$\
"  $$$\  $$ |           $$ |
"  $$$$\ $$ | $$$$$$\ $$$$$$\    $$$$$$\  $$\  $$\  $$\
"  $$ $$\$$ |$$  __$$\\_$$  _|  $$  __$$\ $$ | $$ | $$ |
"  $$ \$$$$ |$$$$$$$$ | $$ |    $$ |  \__|$$ | $$ | $$ |
"  $$ |\$$$ |$$   ____| $$ |$$\ $$ |      $$ | $$ | $$ |
"  $$ | \$$ |\$$$$$$$\  \$$$$  |$$ |      \$$$$$\$$$$  |
"  \__|  \__| \_______|  \____/ \__|       \_____\____/
"
"
"

"set autochdir                           " Change directory when opening files
let g:netrw_altv = 1                    " Puts netrw to the left
let g:netrw_banner = 0                  " Disable hideous banner
let g:netrw_browse_split = 4            " Mimic file opening from IDEs
let g:netrw_liststyle = 3               " Select default layout
let g:netrw_sort_sequence = '[\/]$,*'   " Directories first, files second
let g:netrw_winsize = 25                " Width of explorer set to 25%
let g:netrw_dirhistmax = 0              " Remove history

" Function to toggle Netrw on and off
function! ToggleExplorer()
    if exists("t:expl_no")
        let expl_no = bufwinnr(t:expl_no)
        let curr_win_no = winnr()

        if expl_no != -1
            while expl_no != curr_win_no
                exec "wincmd w"
                let curr_win_no = winnr()
            endwhile

            close
        endif

        unlet t:expl_no
    else
        Vex
        let t:expl_no = bufnr("%")
    endif
endfunction


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
map <silent> <C-b> :call ToggleExplorer()<CR>
inoremap <silent> <C-b> <ESC>:call ToggleExplorer()<CR>

" terminal
nnoremap <leader>ot :terminal<cr>i

" fzf.vim
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fG :GFiles<cr>
nnoremap <leader>fg :Rg<cr>
nnoremap <leader>fb :Buffers<cr>

" vim-fugitive

nnoremap <leader>gs :G<cr>
nnoremap <leader>gf :diffget //2<cr>
nnoremap <leader>gh :diffget //3<cr>

" Telescope.nvim

"nnoremap <leader>ff :lua require('telescope.builtin').find_files()<cr>
"nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<cr>
"nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
"nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<cr>

" LSP

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <C-Space> as trigger keys
imap <C-Space> <Plug>(completion_smart_tab)

" Code navigation shortcuts
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Diagnostics

autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Inline hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
            \ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

" Configure LSP

" Rust

lua <<EOF

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
            }
        }
    }

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    }
)
EOF

