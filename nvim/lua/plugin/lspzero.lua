local lsp = require('lsp-zero').preset(
  {
    float_border = 'rounded',
    call_servers = 'local',
    configure_diagnostics = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = false,
    manage_nvim_cmp = {
      set_sources = 'lsp',
      set_basic_mappings = true,
      set_extra_mappings = true,
      use_luasnip = true,
      set_format = true,
      documentation_window = true,
    }
  }
)

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({ buffer = bufnr })
end)

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

lsp.setup()
