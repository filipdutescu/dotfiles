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



"  $$\    $$\ $$\                       $$$$$$$\  $$\                           $$$$$$\                       $$\               $$\ $$\ 
"  $$ |   $$ |\__|                      $$  __$$\ $$ |                          \_$$  _|                      $$ |              $$ |$$ |
"  $$ |   $$ |$$\ $$$$$$\$$$$\          $$ |  $$ |$$ |$$\   $$\  $$$$$$\          $$ |  $$$$$$$\   $$$$$$$\ $$$$$$\    $$$$$$\  $$ |$$ |
"  \$$\  $$  |$$ |$$  _$$  _$$\ $$$$$$\ $$$$$$$  |$$ |$$ |  $$ |$$  __$$\         $$ |  $$  __$$\ $$  _____|\_$$  _|   \____$$\ $$ |$$ |
"   \$$\$$  / $$ |$$ / $$ / $$ |\______|$$  ____/ $$ |$$ |  $$ |$$ /  $$ |        $$ |  $$ |  $$ |\$$$$$$\    $$ |     $$$$$$$ |$$ |$$ |
"    \$$$  /  $$ |$$ | $$ | $$ |        $$ |      $$ |$$ |  $$ |$$ |  $$ |        $$ |  $$ |  $$ | \____$$\   $$ |$$\ $$  __$$ |$$ |$$ |
"     \$  /   $$ |$$ | $$ | $$ |        $$ |      $$ |\$$$$$$  |\$$$$$$$ |      $$$$$$\ $$ |  $$ |$$$$$$$  |  \$$$$  |\$$$$$$$ |$$ |$$ |
"      \_/    \__|\__| \__| \__|        \__|      \__| \______/  \____$$ |      \______|\__|  \__|\_______/    \____/  \_______|\__|\__|
"                                                               $$\   $$ |                                                              
"                                                               \$$$$$$  |                                                              
"                                                                \______/                                                             

if has('nvim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source "~/.config/nvim/init.vim"
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source "~/.vimrc"
  endif
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

if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'alvan/vim-closetag'

Plug 'filipdutescu/springan.vim'

if &termguicolors
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
else
  Plug 'dylanaraps/wal.vim'
endif

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

" coc.nvim

let g:coc_global_extensions = [
  \ 'coc-clangd',
  \ 'coc-cmake',
  \ 'coc-css',
  \ 'coc-docker',
  \ 'coc-eslint',
  \ 'coc-gitignore',
  \ 'coc-html',
  \ 'coc-java',
  \ 'coc-json',
  \ 'coc-lua',
  \ 'coc-markdownlint',
  \ 'coc-pairs',
  \ 'coc-python',
  \ 'coc-sh',
  \ 'coc-sql',
  \ 'coc-xml',
  \ 'coc-yaml',
  \]

set hidden	" TextEdit might fail otherwise
" For specific servers
set nobackup
set nowritebackup
set updatetime=300	" better time than the default of 4000

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" vim-closetag

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'
" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
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

"    if has('nvim')
"      let g:Hexokinase_highlighters = ['virtual']
"    else
      let g:Hexokinase_highlighters = ['backgroundfull']
"    endif
endif

" wal.vim config

if !&termguicolors
  colorscheme wal
endif

" springan.vim

colorscheme springan


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

"set spell 			" Spell checking
set incsearch			" Search as soon as typing
set hlsearch			" Highlight all results
set ignorecase			" Ignore case when searching
set smartcase			" Use case only if it exists in search
set wildmenu			" Expand commands
filetype plugin indent on 	" Turn on file type detection and indent
syntax on			" Turn on syntax highlighting

" Visual block keep selection after indenting
vmap < <gv
vmap > >gv


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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
set splitbelow splitright
set cursorline
set cursorcolumn
highlight CursorLine ctermbg=Black cterm=bold guibg=#2c2c2c
highlight CursorColumn ctermbg=Black cterm=bold guibg=#2c2c2c


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
	\'n': 'Normal',
	\'no': 'N-Operator Pending',
	\'v': 'Visual',
	\'V': 'V-Line',
	\"\<C-V>": 'V-Block',
	\'s': 'Select',
	\'S': 'S-Block',
	\'i': 'Insert',
	\'R': 'Replace',
	\'Rv': 'V-Replace',
	\'c': 'Command',
	\'cv': 'Vim Ex',
	\'ce': 'Ex',
	\'r': 'Prompt',
	\'rm': 'More',
	\'r?': 'Confirm',
	\'!': 'Shell',
	\'t': 'Terminal'
	\}

set noshowmode
set laststatus=2 
set statusline=
set statusline=%#StatusLineNC#
set statusline+=▶\ %{tolower(g:current_mode[mode()])}\ ◀%#Normal#
set statusline+=\ %#Constant#%{&modified?'✘':'✔'}\ %f%#Normal#
"set statusline+=\ \ %{GetGitBranch()}
set statusline+=%=
set statusline+=\ \ %#Type#%{&filetype==''?'-':tolower(&filetype)}%#Normal#
set statusline+=\ \ %#TermCursor#%{&fenc==''?'-':tolower(&fenc)}%{&fileformat==''?'-':'['.tolower(&fileformat).']'}%#Normal#
set statusline+=\ %#LineNr#⎋\ %p%%\ \ %l/%L\ \ %c\ 


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

set autochdir                           " Change directory when opening files
let g:netrw_altv = 1                    " Puts netrw to the left
let g:netrw_banner = 0                  " Disable hideous banner
let g:netrw_browse_split = 4            " Mimic file opening from IDEs
let g:netrw_liststyle = 3               " Select default layout
let g:netrw_sort_sequence = '[\/]$,*'   " Directories first, files second
let g:netrw_winsize = 25                " Width of explorer set to 25%

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
