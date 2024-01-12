local dap = require('dap')
local miDebuggerPath = ""
-- Just to make it look the same
local slash = ""

dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = vim.fn.expand("$HOME/.vscode/extensions/ms-vscode.cpptools-1.18.5/debugAdapters/bin/OpenDebugAD7.exe"),
    options = {
        detached = false
    }
}

if vim.loop.os_uname().sysname == "Windows_NT" then
    miDebuggerPath = 'C:/msys64/mingw64/bin/gdb.exe'
    slash = "\\"
elseif vim.loop.os_uname().sysname == "Linux" then
    slash = "/"
end


local cppdbg = {
    name = 'Attach to gdbserver: ',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    -- Need to have the gdb executable in this
    miDebuggerPath,
    cwd = '${workspaceFolder}',
    program = function()
        return vim.fn.input('Path to executable: '.. vim.fn.getcwd() .. slash)
    end
}

dap.configurations.cpp = {
    cppdbg
}

dap.configurations.c = dap.configurations.cpp
