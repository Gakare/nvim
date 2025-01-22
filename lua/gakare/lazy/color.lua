local function colorscheme(color)
	color = color or "midnight"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "Comment", { bg = "none" })
end
return {
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
		"norcalli/nvim-colorizer.lua",
		lazy = false,
		config = function()
			require("colorizer").setup({ "*" })
		end,
	},
}
