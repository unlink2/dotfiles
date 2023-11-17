" keymaps 

let mapleader = " "
nnoremap <leader>ff :Ex<CR>
nnoremap <leader>fc :!make format
nnoremap <leader>fv :!make lint
nnoremap <leader>ft :!make tags<CR><CR>
nnoremap <leader>fx :!make

nnoremap <leader>fb :b 

" clear highlight 
nnoremap <leader>cs :noh<CR>

" ctags 
" tag next 
nnoremap <leader>tn :tn<CR>
" tag prev
nnoremap <leader>tp :tp<CR>
" tag search 
nnoremap <leader>ts :ts 
" go to def 
nnoremap <leader>td <C-]> 
" return from def 
nnoremap <leader>tr <C-t> 
" open tag in window 
nnoremap <leader>tj <C-w><C-}> 

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
