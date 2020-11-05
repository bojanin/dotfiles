set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Use system clipboard for everything duh
set clipboard+=unnamedplus
