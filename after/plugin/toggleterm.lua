local toggleterm = require("toggleterm")
toggleterm.setup({})

vim.keymap.set("n", "<C-\\>t", "<cmd>ToggleTerm<cr>")
