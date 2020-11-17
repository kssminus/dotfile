" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    Plugin 'gmarik/vundle'

    " Add your bundles here

    "...All your other bundles...
    Plugin 'flazz/vim-colorschemes'
    colorscheme badwolf

    Plugin 'The-NERD-tree'
    map <F10> :NERDTreeToggle<CR>

    " Programming
    Plugin 'anzaika/go.vim'
    Plugin 'jQuery'
    Plugin 'tpope/vim-rails.git'
    Plugin 'vim-ruby/vim-ruby'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'majutsushi/tagbar'
    map <F10> :NERDTreeToggle<CR>
    map <F8> :TagbarToggle<CR>
    " Plugin 'AutoComplPop'

    " Syntax
    Plugin 'Markdown'
    Plugin 'cucumber.zip'
    Plugin 'tpope/vim-fugitive'
    Plugin 'vim-coffee-script'
    Plugin 'scrooloose/syntastic'
    Plugin 'tpope/vim-surround'
    Plugin 'leafgarland/typescript-vim'

    " utility
    Plugin 'mileszs/ack.vim'
    Plugin 'rstacruz/sparkup.git', {'rtp': 'vim/'}
    Plugin 'easymotion/vim-easymotion'
    Plugin 'c9s/helper.vim'¬
    Plugin 'c9s/treemenu.vim'¬
    Plugin 'c9s/vikube.vim'

" Setting up Vundle - the vim plugin bundler end
" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['.*html']

let g:typescript_indent_disable = 1

silent! nmap <F6> :SyntasticToggleMode<CR>

if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set nocompatible  " disable vi compatibility.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set autoread
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
" Backup
set nowritebackup
set nobackup

set softtabstop=2
set shiftwidth=2
set ru
set sc
set autoindent

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
" be sensitive when there's a capital letter
set smartcase
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
set relativenumber

" Start scrolling three lines before the horizontal window border
set scrolloff=3

function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

function! ReplaceTap()
  :retab
endfunction
noremap <leader>tt :call ReplaceTap()<CR>

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

noremap <leader>nn :call NumberToggle()<CR>
map <Leader> <Plug>(easymotion-prefix)

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" syntastic related config
" [buffer number] followed by filename:
set statusline=[%n]\ %t
" for Syntastic messages:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" show line#:column# on the right hand side
set statusline+=%=%l:%c
