" keymaps 

let mapleader = " "
nnoremap <leader>ff :Ex<CR>
nnoremap <leader>fC :!make format<CR><CR>
nnoremap <leader>fv :!make lint
nnoremap <leader>ft :!make tags<CR><CR>
nnoremap <leader>fx :!make

inoremap <C-Space> <C-x><C-o>

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

" enable Omni
filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd CompleteDone * pclose

" file type .sh (assembly header)
autocmd BufEnter *.inc :setlocal filetype=asm
autocmd VimResized * wincmd =

" Color Pmenu 
hi Pmenu ctermbg=Blue guibg=Blue 
hi PmenuSel ctermbg=Gray guibg=Gray

" Nvim specific!
" Simple LSP setup using nvim-lspconfig

lua << EOF
local lspconfig = require('lspconfig')
lspconfig.clangd.setup {}
lspconfig.rust_analyzer.setup {}


vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>fc', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
EOF
