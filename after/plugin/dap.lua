-- For nvim-dap
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

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)

-- For nvim-dap-ui
require("neodev").setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
    ...
})

require("dapui").setup()
local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- For nvim-dap-virtual-text
require('nvim-dap-virtual-text').setup()
