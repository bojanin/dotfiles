set nocompatible              " be iMproved, required
filetype off                  " required
set clipboard=unnamed         " copies to clipboard rather than vim buffer

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle stuff
call vundle#begin()
Plugin 'justinmk/vim-syntax-extra'
Plugin 'tibabit/vim-templates'
Plugin 'VundleVim/Vundle.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'lifepillar/vim-mucomplete'
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

autocmd BufNewFile,BufRead *.md set filetype=markdown " sets filetype to markdown when file extension is .md


"auto completion settings"
set completeopt+=menuone
set completeopt+=noinsert
set noinfercase
set completeopt-=preview
set completeopt+=menuone,noselect

" The following line assumes `brew install llvm` in macOS
let g:clang_library_path = '/usr/local/opt/llvm/lib/libclang.dylib'
let g:clang_user_options = '-std=c++14'
let g:clang_complete_auto = 1
let g:mucomplete#enable_auto_at_startup = 1

"shut off completion messages"
set shortmess+=c

" removed up, down, left right to learn to use hjkl
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set bg=light
