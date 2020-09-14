""""""""""""""""""
" Vim-Plug install
""""""""""""""""""
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

set hidden	" TextEdit might fail otherwise
" For specific servers
set nobackup
set nowritebackup
set updatetime=300	" better time than the default of 4000
"set signcolumn=yes

"""""""""""""""""
" install plugins
"""""""""""""""""
if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
endif

Plug 'neoclide/coc.nvim', {'branch': 'release'}

if &termguicolors
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
else
  Plug 'dylanaraps/wal.vim'
endif

call plug#end()

""""""""""""""""
" plugin configs
""""""""""""""""

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

  if has('nvim')
    let g:Hexokinase_highlighters = ['virtual']
  else
    let g:Hexokinase_highlighters = ['backgroundfull']
  endif
endif

" wal.vim config
if !&termguicolors
  colorscheme wal
endif

"""""""""""""""""""""""""""""""
" Display/look related settings
"""""""""""""""""""""""""""""""
set number
set relativenumber
"set termguicolors
set background="dark"

""""""""""""""""""""""""
" Functionality settings
""""""""""""""""""""""""

"set spell 			" Spell checking
set incsearch			" Search as soon as typing
set hlsearch			" Highlight all results
set ignorecase			" Ignore case when searching
set smartcase			" Use case only if it exists in search
set wildmenu			" Expand commands
filetype plugin indent on 	" Turn on file type detection and indent
syntax on			" Turn on syntax highlighting

""""""""""""""""""""""
" Consistency settings
""""""""""""""""""""""

set nocompatible
set encoding=UTF-8
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
set splitbelow splitright

"""""""""""""""""""""
" Statusline settings
"""""""""""""""""""""
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

""""""""""""""""
" Get git branch
""""""""""""""""

function! GetGitBranch() abort
	let l:branch = trim(system('git rev-parse --abbrev-ref HEAD 2>/dev/null'))
	if l:branch == ''
		return '―'
	endif
	return l:branch
endfunction

set noshowmode
set laststatus=2 
set statusline=
set statusline=%#PmenuSbar#
set statusline+=▶\ %{tolower(g:current_mode[mode()])}\ ◀%#Normal#
set statusline+=\ %#Constant#%{&modified?'✘':'✔'}\ %f%#Normal#
"set statusline+=\ \ %{GetGitBranch()}
set statusline+=%=
set statusline+=\ \ %#Type#%{&filetype==''?'-':tolower(&filetype)}%#Normal#
set statusline+=\ \ %#CursorLine#%{&fenc==''?'-':tolower(&fenc)}%{&fileformat==''?'-':'['.tolower(&fileformat).']'}%#Normal#
set statusline+=\ %#LineNr#⎋\ %p%%\ \ %l/%L\ \ %c\ 

""""""""""""""""
" Netrw settings
""""""""""""""""

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

" Map Ctrl+b as the command to open Netrw
map <silent> <C-b> :call ToggleExplorer()<CR>
inoremap <silent> <C-b> <ESC>:call ToggleExplorer()<CR>
