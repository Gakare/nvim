local function colorscheme(color)
<<<<<<< HEAD
	color = color or "default"
	vim.cmd.colorscheme(color)
=======
    color = color or "default"
    vim.cmd.colorscheme(color)
>>>>>>> 8387906d15823b76dc4fd81fa44b98139bdf1163

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "Comment", { bg = "none" })
end

return {
<<<<<<< HEAD
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
=======
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
        "norcalli/nvim-colorizer.lua",
        lazy = false,
        config = function()
            require("colorizer").setup({ "*" })
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
>>>>>>> 8387906d15823b76dc4fd81fa44b98139bdf1163
}
