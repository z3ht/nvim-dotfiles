local dap = require('dap')
dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '/usr/local/src/cpptools-1.15.4/extension/debugAdapters/bin/OpenDebugAD7'
}
dap.configurations.cpp = {
    {
        name = "Launch cppdbg",
        type = 'cppdbg',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        miDebuggerPath = '/usr/local/src/cpptools-1.15.4/extension/debugAdapters/lldb-mi/bin/lldb-mi',
        targetArchitecture = 'arm64'
    }
}

local text = require("nvim-dap-virtual-text")
text.setup()

vim.keymap.set("n", "<leader>as", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>ab", function() dap.clear_breakpoints() end)

vim.keymap.set('n', '<Leader>auu', function()
  local widgets = require('dap.ui.widgets')
  local my_sidebar = widgets.sidebar(widgets.threads)
  my_sidebar.open()
end)
vim.keymap.set('n', '<Leader>aui', function()
  local widgets = require('dap.ui.widgets')
  local c_float = widgets.centered_float(widgets.threads)
  c_float.open()
end)

vim.keymap.set('n', '<Leader>aiu', function()
  local widgets = require('dap.ui.widgets')
  local my_sidebar = widgets.sidebar(widgets.frames)
  my_sidebar.open()
end)
-- telescope responsible for frames centered float

vim.keymap.set('n', '<Leader>aou', function()
  local widgets = require('dap.ui.widgets')
  local my_sidebar = widgets.sidebar(widgets.scopes)
  my_sidebar.open()
end)
vim.keymap.set('n', '<Leader>aoi', function()
  local widgets = require('dap.ui.widgets')
  local c_float = widgets.centered_float(widgets.scopes)
  c_float.open()
end)

vim.keymap.set('n', '<Leader>ap', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.expression)
end)

vim.keymap.set('n', '<Leader>a[', function() dap.repl.open() end)

vim.keymap.set('n', '<leader>aj', function() dap.step_into() end)
vim.keymap.set('n', '<leader>aj', function() dap.step_into() end)
vim.keymap.set('n', '<leader>ak', function() dap.step_out() end)
vim.keymap.set('n', '<leader>al', function() dap.step_over() end)
vim.keymap.set('n', '<leader>a;', function() dap.continue() end)
