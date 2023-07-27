require("dapui").setup()

local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}

-- If you want to use this for Rust and C, add something like this:
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

vim.api.nvim_create_user_command('Break', function() require('dap').toggle_breakpoint() end, {})
vim.api.nvim_create_user_command('Cont', function() require('dap').continue() end, {})
vim.api.nvim_create_user_command('StepIn', function() require('dap').step_into() end, {})
vim.api.nvim_create_user_command('DapReplOpen', function() require('dap').repl.open() end, {})
vim.api.nvim_create_user_command('DapReplClose', function() require('dap').repl.close() end, {})

vim.api.nvim_create_user_command('DapOpen', function() require("dapui").open() end, {})
vim.api.nvim_create_user_command('DapClose', function() require("dapui").close() end, {})
vim.api.nvim_create_user_command('DapToggle', function() require("dapui").toggle() end, {})

vim.keymap.set('n', '<F5>', function() require 'dap'.continue() end)
vim.keymap.set('n', '<F10>', function() require 'dap'.step_over() end)
vim.keymap.set('n', '<F11>', function() require 'dap'.step_into() end)
vim.keymap.set('n', '<F12>', function() require 'dap'.step_out() end)
vim.keymap.set('n', '<Leader>b', function() require 'dap'.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<Leader>lp',
  function() require 'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require 'dap'.repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require 'dap'.run_last() end)
vim.keymap.set(
  'n', '<leader>dh', function() require("dap.ui.widgets").hover() end, { silent = true })
