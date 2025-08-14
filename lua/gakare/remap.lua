vim.g.mapleader = " "

-- Normal mode
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>cp0", "<cmd>cd ~<CR><bar><cmd>pwd<CR>")
vim.keymap.set("n", "<leader>cp1", "<cmd>cd %:p:h<CR><bar><cmd>pwd<CR>")

-- TODO: Might want to moveh some stuff from lsp to be implemented to qflist/loclist
vim.keymap.set("n", "<leader>td", function()
	vim.diagnostic.setqflist()
end)
vim.keymap.set("n", "<M-c>", "<cmd>cclose<cr>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")

-- !Open config file
vim.keymap.set("n", "<leader>nv", "<cmd>execute 'edit '.stdpath('config').'/init.lua'<CR>")

-- !Only for windows
vim.keymap.set("n", "<leader><C-e>", "<cmd>cd %:p:h<CR><bar><cmd>!Explorer.exe .<CR><CR>")

--Helpful yankings: asbjorHaland
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Control the size of splits (height/width) [from tj devries]
vim.keymap.set("n", "<leader>>", "<c-w>5>")
vim.keymap.set("n", "<leader><", "<c-w>5<")
vim.keymap.set("n", "<leader>^", "<c-w>+")
vim.keymap.set("n", "<leader>V", "<c-w>-")

vim.keymap.set("n", "<leader>h", "<c-w><c-h>")
vim.keymap.set("n", "<leader>j", "<c-w><c-j>")
vim.keymap.set("n", "<leader>k", "<c-w><c-k>")
vim.keymap.set("n", "<leader>l", "<c-w><c-l>")

-- Visual mode
vim.keymap.set("v", "<leader>y", '"+y')
-- Gotten from https://vimtricks.com/p/vimtrick-moving-lines/
vim.keymap.set("v", "J", ":m '>+1<CR>gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv")

-- Command mode
vim.keymap.set("x", "<leader>p", '"_dP')

-- Terminal mode
vim.keymap.set("t", "<escape><escape>", "<c-\\><c-n>")
vim.keymap.set("t", "<c-\\>e", "exit<cr>")
