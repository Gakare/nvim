return {
	{
		"folke/trouble.nvim",
		config = function()
			local trouble = require("trouble")
			trouble.setup({
				debug = false,
				opts = {},
			})

			vim.keymap.set("n", "<leader>tl", "<cmd>Trouble lsp toggle<cr>")
			vim.keymap.set("n", "<leader>ts", "<cmd>Trouble symbols toggle<cr>")
		end,
	},
}
