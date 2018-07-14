"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

"set termguicolors
set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab

map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

au VimLeave * set guicursor=a:block-blinkon0

call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'rust-lang/rust.vim'
Plug 'neomake/neomake'
Plug 'tpope/vim-fugitive'
call plug#end()

" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
