local trouble = require("trouble")
trouble.setup({
    opts = {},
})

vim.keymap.set("n", "<leader>td", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>tl", "<cmd>Trouble lsp toggle<cr>")
