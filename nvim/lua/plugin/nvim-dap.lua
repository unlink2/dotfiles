require("dapui").setup()


vim.api.nvim_create_user_command('Break', function() require('dap').toggle_breakpoint() end, {})
vim.api.nvim_create_user_command('Cont', function() require('dap').continue() end, {})
vim.api.nvim_create_user_command('StepIn', function() require('dap').step_into() end, {})
vim.api.nvim_create_user_command('DapReplOpen', function() require('dap').repl.open() end, {})
vim.api.nvim_create_user_command('DapReplClose', function() require('dap').repl.close() end, {})

vim.api.nvim_create_user_command('DapOpen', function() require("dapui").open() end, {})
vim.api.nvim_create_user_command('DapClose', function() require("dapui").close() end, {})
vim.api.nvim_create_user_command('DapToggle', function() require("dapui").toggle() end, {})
