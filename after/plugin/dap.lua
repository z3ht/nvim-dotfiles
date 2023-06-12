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

vim.keymap.set("n", "<leader>aq", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>aa", function() dap.list_breakpoints() end)
vim.keymap.set("n", "<leader>azz", function()  end)
vim.keymap.set("n", "<leader>azg", function() end)
-- vim.keymap.set("n", "<leader>a", function() dap.list_breakpoints() end)

vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
