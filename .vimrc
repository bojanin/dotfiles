set nocompatible              " be iMproved, required
filetype off                  " required
set clipboard=unnamed         " copies to clipboard rather than vim buffer
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set bg=dark

" Vundle stuff
call vundle#begin()
Plugin 'jeaye/color_coded'
Plugin 'morhetz/gruvbox'
Plugin 'vhdirk/vim-cmake'
Plugin 'rdnetto/YCM-Generator'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'tibabit/vim-templates'
Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()

set history=300 " sets undo history to 300
syntax enable	" enables syntax
set wildmenu	" sets the visual menu on the bottom
set path+=**	" enables fuzzy searching with :find

filetype plugin indent on " not sure what this does but is requires
set number 		  " enables line numbers
set tabstop=4	  " number of visual spaces per tab
set softtabstop=4	  " number of spaces in tab while editing
set shiftwidth=4
set expandtab 		  " turns tabs into spaces
set cursorline 		  " show command in bottom bar
set showcmd 		  " highlight current line 
set lazyredraw 		  " redraw screen lazily for faster macros
set showmatch 		  "highlight matching [{()}]
set incsearch           " search as characters are entered
:au BufEnter *.* :set colorcolumn= " Removed the annoying color column.
autocmd BufNewFile,BufRead *.md set filetype=markdown " sets filetype to markdown when file extension is .md

" sets pymodes python to python3
let g:pymode_python='python3'

" CMake flags
let g:cmake_cxx_compiler='clang++'
let g:cmake_c_compiler='clang'
let g:cmake_ycm_symlinks=1

" remove the question when opening a new file in vim with uses ycm
let g:ycm_confirm_extra_conf=0

"auto completion settings"
set completeopt+=menuone
set completeopt+=noinsert
set noinfercase
set completeopt-=preview
set completeopt+=menuone,noselect

" NERDTree
:map <C-n> :NERDTree

"shut off completion messages"
set shortmess+=c

" removed up, down, left right to learn to use hjkl
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

colorscheme gruvbox
