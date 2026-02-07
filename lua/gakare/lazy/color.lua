local function colorscheme(color)
	color = color or "default"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "Comment", { bg = "none" })
end

return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		opts = {},
		priority = 1000,
		config = function()
			colorscheme("carbonfox")
		end,
	},
	{
		"dasupradyumna/midnight.nvim",
		lazy = false,
		opts = {},
		priority = 1000,
		config = function()
			colorscheme()
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		lazy = false,
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
}
