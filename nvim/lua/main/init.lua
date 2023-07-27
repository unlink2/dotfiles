require("main.lazy")
require("main.remaps")

vim.opt.termguicolors = true
vim.cmd [[colorscheme tokyonight]]
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.clipboard = 'unnamedplus'

vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

vim.opt.updatetime = 50

vim.opt.signcolumn = "yes"
-- vim.opt.colorcolumn = "80"

vim.opt.spelllang = 'en_us'
vim.opt.spell = false
