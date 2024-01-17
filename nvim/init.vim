" keymaps 

let mapleader = " "
nnoremap <leader>ff :Ex<CR>
nnoremap <leader>fc :!ubuild format<CR><CR>
nnoremap <leader>fv :!ubuild lint
nnoremap <leader>ft :!ubuild tags<CR><CR>
nnoremap <leader>fx :!ubuild

" nnoremap <leader>fc :!make format<CR><CR>
" nnoremap <leader>fv :!make lint
" nnoremap <leader>ft :!make tags<CR><CR>
" nnoremap <leader>fx :!make


nnoremap <leader>fb :b 

" clear highlight 
nnoremap <leader>cs :noh<CR>

" ctags 
" tag next 
nnoremap <leader>tn :tn<CR>
" tag prev
nnoremap <leader>tp :tp<CR>
" tag search 
nnoremap <leader>ts :tselect 
" go to def 
nnoremap <leader>td <C-]> 
" return from def 
nnoremap <leader>tr <C-t> 
" open tag in window 
nnoremap <leader>tg <C-w><C-}> 

" custom command

" save session 
command Ds mksession! .session
" restore session 
command Rs source .session

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

" file type .sh (assembly header)
autocmd BufEnter *.inc :setlocal filetype=asm
autocmd VimResized * wincmd =

