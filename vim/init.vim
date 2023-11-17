" keymaps 

let mapleader = " "
nnoremap <leader>ff :Ex<CR>
nnoremap <leader>fc :!./scripts/format.sh
nnoremap <leader>fv :!./scripts/lint.sh
nnoremap <leader>fx :!make

" settings 
set termguicolors
set number
set relativenumber 
set clipboard=unnamedplus

set expandtab
set smartindent
set tabstop=2
set shiftwidth=2

set incsearch

set autoread
set updatetime=50
