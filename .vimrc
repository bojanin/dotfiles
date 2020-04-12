filetype off
set nocompatible
syntax on
set ai
set number
set hlsearch
set ruler
set showmatch
set showcmd
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

au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set fileformat=unix

set bg=dark
set tabstop=2 
set shiftwidth=2 
set expandtab
set autoindent

let mapleader = ","

map <C-b> :NERDTreeToggle<CR>

set backspace=indent,eol,start

call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'arzg/vim-colors-xcode'
Plug 'ycm-core/YouCompleteMe'
call plug#end()
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")
colorscheme xcodedark
