return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>fg", "<cmd>G<cr>")
			vim.keymap.set("n", "<leader>fa", "<cmd>G push<cr>")
		end,
	},
}
