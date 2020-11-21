
" enable syntax
syntax on
" No .swp
set noswapfile
" set markdown filetypes
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
" set cpp filetypes
autocmd BufNewFile,BufFilePre,BufRead *.cc set filetype=cpp
" turn on line numbers
set number
" convert tabs to spaces
set expandtab
" insert and delete indent correctly
set smarttab
" tab size
set shiftwidth=4
set softtabstop=4
set tabstop=4
" set tab size to 2 for .h, .cc files
autocmd FileType cpp setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType tex setlocal shiftwidth=2 softtabstop=2 tabstop=2
" set wrap size for just programming files
autocmd FileType c,cpp,java,py,swift set textwidth=100 " set hard wrap width
" set format options (default tcq) see http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
set fo-=t " don't auto-wrap text
" set column width marker
set colorcolumn=101
" proper indenting
set autoindent
set nosmartindent
set nocindent
" turn off error beep/flash
set visualbell t_vb=
" turn off visual bell
set novisualbell

" autoread files changed on disk
set autoread
set cursorline

" lets you mass indent multiple lines
vnoremap < <gv
vnoremap > >gv
" Switch tabs better
nnoremap H gT
nnoremap L gt

" Better searching
set ignorecase
set smartcase
set incsearch
set hlsearch

call plug#begin('~/.vim/plugged')
" YCM causes cpu heartattacks on mac cpp files
autocmd FileType py Plug 'Valloric/YouCompleteMe'
" more syntax highlighting
Plug 'bfrg/vim-cpp-modern'
Plug 'https://github.com/xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'chengzeyi/fzf-preview.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'https://github.com/vim-scripts/a.vim'
call plug#end()

let mapleader = ","
map <C-b> :NERDTreeToggle<CR>
set backspace=indent,eol,start

" best theme, obviosuly
autocmd vimenter * ++nested colorscheme gruvbox

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" ctags recursive (from http://stackoverflow.com/a/5019111/53997 )
set tags=tags;/

let g:ycm_confirm_extra_conf = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files=0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ycm_autoclose_preview_window_after_completion = 1

" fuzzy search
set rtp+=~/.fzf
nnoremap <c-p> :GFiles<cr>
nnoremap <c-g> :FZFRg<cr>

set mouse=a

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always -g *.{djinni,cc,h,swift,kt,lcm,proto,java,py}'
  \  . (len(<q-args>) > 0 ? <q-args> : '""'), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
