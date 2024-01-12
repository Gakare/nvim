vim.opt.wrap = false
vim.keymap.set('n', '<leader>74', '<cmd>set cc=74<cr>')
vim.keymap.set('n', '<leader>gcc', '<cmd>w<CR><bar><cmd>cd %:p:h<CR><bar><cmd>!g++ -pedantic -Wall -Werror %<CR>')
