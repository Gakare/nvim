vim.opt.colorcolumn = ""
vim.opt.wrap = true
vim.keymap.set("n", "<leader>cl", "<cmd>w<cr><bar><cmd>cd %:p:h<cr><bar><cmd>!pdflatex %<cr>")
vim.keymap.set("n", "<leader>xe", "<cmd>w<cr><bar><cmd>cd %:p:h<cr><bar><cmd>!xelatex %<cr>")
