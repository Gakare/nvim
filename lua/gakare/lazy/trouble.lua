return {
	{
		"folke/trouble.nvim",
		config = function()
			local trouble = require("trouble")
			trouble.setup({
				debug = false,
				opts = {},
			})

			vim.keymap.set("n", "<leader>td", "<cmd>Trouble diagnostics toggle<cr>")
			vim.keymap.set("n", "<leader>tl", "<cmd>Trouble lsp toggle<cr>")
		end,
	},
}
