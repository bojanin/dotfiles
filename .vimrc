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
autocmd FileType cpp,lcm,proto,djinni,swift setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType tex setlocal shiftwidth=2 softtabstop=2 tabstop=2
" set wrap size for just programming files
autocmd FileType c,cpp,java,py,swift set textwidth=100 " set hard wrap width

" Use system keyboard for everything
set clipboard=unnamed
" Set syntax of lcm files to cpp
autocmd BufNewFile,BufRead *.lcm set filetype=cpp
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

" Show the arguments of a function and autocomplete in ycm
set completeopt=menuone,popup
" now it is possible to paste many times over selected text
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'

" call code_format on file write
function! SkydioCodeFormat()
  silent exec '!code_format %'
  exec 'e'
  exec 'redraw!'
endfunction

" call skydio formatter on filewrite
autocmd BufWritePost * call SkydioCodeFormat()

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

set rtp+=~/.fzf

call plug#begin('~/.vim/plugged')
" more syntax highlighting
Plug 'bfrg/vim-cpp-modern'
" fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" git wrapper
Plug 'tpope/vim-fugitive'
" Preview pane 
Plug 'chengzeyi/fzf-preview.vim'
" +/- leftside for git
Plug 'mhinz/vim-signify'
" theme
Plug 'morhetz/gruvbox'
" kotlin highlighting
Plug 'udalov/kotlin-vim'
" switch to header/cc files
Plug 'https://github.com/vim-scripts/a.vim'
" autocompelte
Plug 'Valloric/YouCompleteMe'
" swift syntax
Plug 'keith/swift.vim'
" djinni syntax
Plug 'r0mai/vim-djinni'
call plug#end()

noremap <Space> <Nop>
map <Space> <leader>

nnoremap <c-g> :RG<cr>
set backspace=indent,eol,start

" best theme, obviosuly
autocmd vimenter * ++nested colorscheme gruvbox
set bg=dark
let &t_SI = "\<esc>[5 q"  " blinking I-beam in insert mode
let &t_SR = "\<esc>[3 q"  " blinking underline in replace mode
let &t_EI = "\<esc>[ q"  " default cursor (usually blinking block) otherwise

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_hover = 'CursorHold'
let g:ycm_auto_trigger = 1
" make this 0 if you see performance hits
let g:ycm_clangd_uses_ycmd_caching = 1
nnoremap <silent> <leader>gd :silent! YcmCompleter GoTo <CR>
nnoremap <silent> <leader>gr :silent! YcmCompleter GoToReferences <CR>
nnoremap <silent> <leader>rr :silent! YcmCompleter RefactorRename <CR>
 
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-a>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

set updatetime=750
let g:ycm_auto_hover='CursorHold'

" fuzzy search
nnoremap <c-p> :GFiles<cr>

set mouse=a
" VSCode like search
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case
              \ -g "*.{djinni,proto,mm,m,lcm,cc,h,swift,py,java,kt,cmake,txt,xml,rs,jam,bzl,bazel}"
              \ -g "!build/*"
              \ -g "!third_party_modules/*"
              \ -g "!third_party/*"
              \ -g "!bazel-out/*" -- %s || true'

  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif
      endif
" Have Vim maintain undo history between sessions
set undofile "
set undodir=~/.vim/undodir
" more git config
let g:signify_vcs_list = ['git', 'svn', 'hg']
let g:signify_sign_change = '~'
let g:signify_sign_delete = '-'
let g:signify_update_on_focusgained = 1
" copied from jerrys vimrc
" makes colors POP
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

