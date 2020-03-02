filetype off
set nocompatible
syntax on
set ai
set number
set hlsearch
set ruler
set showmatch
set showcmd
set lazyredraw
highlight Comment ctermfg=green
set ignorecase
set noswapfile
set nobackup
set nowritebackup
set encoding=utf-8
set fileencoding=utf-8
set mouse=a
set clipboard=unnamed
autocmd! bufwritepost .vimrc source %
set autowrite

vnoremap < <gv
vnoremap > >gv
set foldmethod=indent
set foldlevel=99

let g:go_fmt_command="goimports"
let g:go_auto_type_info=1


au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

set bg=dark

autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
set backspace=indent,eol,start
call plug#begin()
Plug 'vim-scripts/indentpython.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/nerdtree'
Plug 'arzg/vim-colors-xcode'
call plug#end()
colorscheme xcodedark
