set nocompatible              " be iMproved, required
filetype off                  " required
set clipboard=unnamed         " copies to clipboard rather than vim buffer

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set bg=dark

" Vundle stuff
call vundle#begin()
Plugin 'morhetz/gruvbox'
Plugin 'rdnetto/YCM-Generator'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call vundle#end()

set history=300 " sets undo history to 300
syntax enable   " enables syntax
set wildmenu    " sets the visual menu on the bottom
set path+=**    " enables fuzzy searching with :find

filetype plugin indent on " not sure what this does but is requires
set number        " enables line numbers
set tabstop=4     " number of visual spaces per tab
set softtabstop=4     " number of spaces in tab while editing
set shiftwidth=4
set expandtab         " turns tabs into spaces
set cursorline        " show command in bottom bar
set showcmd           " highlight current line 
set lazyredraw        " redraw screen lazily for faster macros
set showmatch         "highlight matching [{()}]
set incsearch           " search as characters are entered
:au BufEnter *.* :set colorcolumn= " Removed the annoying color column.
autocmd BufNewFile,BufRead *.md set filetype=markdown " sets filetype to markdown when file extension is .md

let g:autofmt_autosave=1
" sets pymodes python to python3
let g:pymode_python='python3'

"" CMake flags
let g:cmake_cxx_compiler='clang++'
let g:cmake_c_compiler='clang'
let g:cmake_ycm_symlinks=1

" objc triggers
let g:ycm_semantic_triggers = {
 \ 'objc' : ['re!\@"\.*"\s',
 \ 're!\@\w+\.*\w*\s',
 \ 're!\@\(\w+\.*\w*\)\s',
 \ 're!\@\(\s*',
 \ 're!\@\[.*\]\s',
 \ 're!\@\[\s*',
 \ 're!\@\{.*\}\s',
 \ 're!\@\{\s*',
 \ "re!\@\’.*\’\s",
 \ '#ifdef ',
 \ 're!:\s*',
 \ 're!=\s*',
 \ 're!,\s*', ],
 \ }

" remove the question when opening a new file in vim with uses ycm
let g:ycm_confirm_extra_conf=0
let g:ycm_extra_conf_vim_data = ['&filetype']
let g:ycm_max_diagnostics_to_display = 0
" logos syntax for theos files.
au BufNewFile,BufRead *.xm,*.xmm,*.l.mm setf logos

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

let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ }
let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'go': ['go-langserver'] }

noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>
" }}}
colorscheme gruvbox
