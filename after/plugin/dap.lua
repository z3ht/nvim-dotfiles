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
