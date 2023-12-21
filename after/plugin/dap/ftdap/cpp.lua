local dap = require('dap')

dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = "C:\\Users\\Owner\\.vscode\\extensions\\ms-vscode.cpptools-1.18.5\\debugAdapters\\bin\\OpenDebugAD7.exe",
    options = {
        detached = false
    }
}

local cppdbg = {
    name = 'Attach to gdbserver: ',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    -- Need to have the gdb executable in this
    miDebuggerPath = 'C:\\msys64\\mingw64\\bin\\gdb.exe',
    cwd = '${workspaceFolder}',
    program =  function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
    end,
}

dap.configurations.cpp = {
    cppdbg
}

dap.configurations.c = dap.configurations.cpp
