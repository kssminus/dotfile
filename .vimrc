" Make Vim more useful
"" 편집기능 설정
colorscheme badwolf
"" 편집기능 설정
set softtabstop=2
set shiftwidth=2
set backspace=indent,eol,start
set ru
set sc
"set nu
"set nuw=5
"set backspace=2
set autoindent
"set nowrap
"set noet
"set sts=0
"set magic
set title
"set linespace=100
"set paste

set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
set expandtab
" Show “invisible” characters
set lcs=trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers

" Start scrolling three lines before the horizontal window border
set scrolloff=3


" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" tab
" map <Char-27>j :tabp<CR>
" map <Char-27>k :tabn<CR>
" map <Tab> >>
" vmap <Tab> >gv
" vmap <S-Tab> <gv

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType c      set omnifunc=ccomplete#Complete
  autocmd FileType css    set omnifunc=csscomplete#CompleteCSS
  autocmd FileType html   set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType php    set omnifunc=phpcomplete#CompletePHP
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType ruby   set omnifunc=rubycomplete#Complete
  autocmd FileType sql    set omnifunc=sqlcomplete#Complete
  autocmd FileType xml    set omnifunc=xmlcomplete#CompleteTags
endif

" NerdTree
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <F10> :NERDTreeToggle<CR>
