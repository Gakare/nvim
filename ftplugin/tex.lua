vim.opt.colorcolumn = ""
vim.opt.wrap = true

local os = vim.loop.os_uname().sysname

if os == "Windows_NT" then
    vim.keymap.set("n", "<leader>lt", "<cmd>w<cr><bar><cmd>cd %:p:h<cr><bar><cmd>!miktex-pdflatex %<cr>")
    vim.keymap.set("n", "<leader>xe", "<cmd>w<cr><bar><cmd>cd %:p:h<cr><bar><cmd>!miktex-xelatex %<cr>")
    -- vim.keymap.set("n", "<leader>sm",
    --     "<cmd>w<cr><bar><cmd>cd %:p:h<cr><bar><cmd>echo expand('%:r')..'.pdf'<cr><bar><cmd>!sumatrapdf.exe<cr>")
end

if os == "Linux" then
    vim.keymap.set("n", "<leader>lt", "<cmd>w<cr><bar><cmd>cd %:p:h<cr><bar><cmd>!pdflatex %<cr>")
    vim.keymap.set("n", "<leader>xe", "<cmd>w<cr><bar><cmd>cd %:p:h<cr><bar><cmd>!xelatex %<cr>")
end
