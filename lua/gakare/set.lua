vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true
vim.opt.scrolloff = 9
vim.opt.termguicolors = true
vim.opt.undofile = true

vim.g.mapleader = " "
vim.opt.wrap = false

vim.opt.splitbelow = true

vim.opt.exrc = true

vim.bo.filetype = "true"
vim.g.loaded_python_provider = 0

if vim.loop.os_uname().sysname == "Windows" then
	vim.opt.shell = "powershell.exe"
	vim.opt.shellcmdflag = "-Command"
end
